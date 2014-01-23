class ChargesController < ApplicationController

  def index
    @customers_for_failed = Customer.includes(:charges).where(charges: {paid: false, refunded: false})
    @customers_for_disputed = Customer.includes(:charges).where(charges: {paid: true, refunded: true})
    @customers_for_success = Customer.includes(:charges).where(charges: {paid: true, refunded: false})
  end

  def new
    @currencies = ["usd", "gbp", "eur", "inr"]
    @charge = Charge.new
    @customers = Customer.all
  end

  def create
    charge = Charge.create(charge_params)

    if charge.save
      charge.update_attributes(:customer_id => params[:customer].to_i,
                               :refunded => false,
                               :paid => false)
      redirect_to "/charges"
    end


  end

  private

  def charge_params
    params.require(:charge).permit(:amount, :currency)
  end
end
