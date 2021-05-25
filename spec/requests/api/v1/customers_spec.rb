require 'rails_helper'

RSpec.describe "Api::V1::Customers", type: :request do
  let(:result) { JSON.parse(response.body) }
  let!(:user) { User.create(email: "test@gmail.com", password: "123456", password_confirmation: "123456") }
  let!(:customer) { Customer.create(name: "Customer name") }

  before do
    allow(Tokenizer).to receive(:decode)
      .and_return(user)
  end

  describe "GET /api/v1/customers" do
    it "returns all customers" do
      get api_v1_customers_path

      expect(response).to have_http_status(200)
      expect(result[0]["name"]).to eq("Customer name")
    end
  end

  describe "POST /api/v1/customers" do
    it "creates customer" do
      expect {
        post api_v1_customers_path, params: { customer: { name: "Another customer" } }
      }.to change(Customer, :count).by(1)
    end
  end

  describe "PATCH /api/v1/customers/:id" do
    it "creates customer" do
      patch api_v1_customer_path(customer), params: { customer: { name: "Another customer" } }

      expect(customer.reload.name).to eq("Another customer")
    end
  end

  describe "DELETE /api/v1/customers/:id" do
    it "deletes customer" do
      expect { delete api_v1_customer_path(customer)}
        .to change(Customer, :count).by(-1)
    end
  end
end
