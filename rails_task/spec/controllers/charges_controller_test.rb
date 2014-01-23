require "spec_helper"

describe ChargesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do

    before(:each) do
      @customer = Customer.create(:id => 2, :name => "Billy", :surname => "Holiday")
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :new
      expect(assigns(:customers)).to match_array([@customer])
    end
  end
end