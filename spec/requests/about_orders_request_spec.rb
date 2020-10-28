require 'rails_helper'

RSpec.describe "AboutOrders", type: :request do

  describe "GET /update" do
    it "returns http success" do
      get "/about_orders/update"
      expect(response).to have_http_status(:success)
    end
  end

end
