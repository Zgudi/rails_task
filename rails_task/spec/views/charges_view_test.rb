require 'spec_helper'

describe "charges/index" do
  before(:each) do
    Customer.create(:id => 1, :name => "Mark", :surname => "Theosis")
    Customer.create(:id => 2, :name => "Billy", :surname => "Holiday")
    Customer.create(:id => 3, :name => "Stefen", :surname => "King")

    @customers_for_failed = Customer.includes(:charges).where(charges: {paid: false, refunded: false})
    @customers_for_disputed = Customer.includes(:charges).where(charges: {paid: true, refunded: true})
    @customers_for_success = Customer.includes(:charges).where(charges: {paid: true, refunded: false})
  end

  it "should render charges list" do
    assign(:customers_for_failed, @customers_for_failed)
    assign(:customers_for_disputed, @customers_for_disputed)
    assign(:customers_for_success, @customers_for_success)

    render

    expect(rendered).to include("Failed Charges")
    expect(rendered).to include("Disputed Charges")
    expect(rendered).to include("Successful Charges")
  end

  it "renders charges list with 10 successful charges ans 5 disputed charges and 0 failed charges" do
    Charge.create(:amount => 100, :currency => "usd", :customer_id => 1, :paid => false, :refunded => false)
    5.times{Charge.create(:amount => 100, :currency => "usd", :customer_id => 2, :paid => true, :refunded => true)}
    10.times{Charge.create(:amount => 100, :currency => "usd", :customer_id => 3, :paid => true, :refunded => false)}

    assign(:customers_for_failed, @customers_for_failed)
    assign(:customers_for_disputed, @customers_for_disputed)
    assign(:customers_for_success, @customers_for_success)

    render

    expect(rendered).to include("Mark Theosis: 1")
    expect(rendered).to include("Billy Holiday: 5")
    expect(rendered).to include("Stefen King: 10")
  end
end

describe "charges/new" do
  before(:each) do
    assign(:charge, Charge.new)
    assign(:customers, [Customer.create(:id => 2, :name => "Billy", :surname => "Holiday")])
    assign(:currencies, ["usd", "gbp", "eur", "inr"])
  end

  it "should render new charge form" do

    render

    expect(rendered).to include("Customers")
    expect(rendered).to include("Amount")
    expect(rendered).to include("Currency")
    expect(rendered).to include("Add new charge")
  end
end