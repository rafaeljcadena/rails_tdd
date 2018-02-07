require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "JSON 200 OK" do
      get customer_path(id: 1, format: :json)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(id: 1, name:"Claudine Jenkins", email:"email-1@email.com");
    end

    it "JSON with rspec matchers" do
      get customer_path(id: 1, format: :json)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(id: (be == 1), name: (be_kind_of String), email: (be_kind_of String));
    end

  end
end