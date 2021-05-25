require 'rails_helper'

RSpec.describe "Api::V1::AuthController", type: :request do
  let(:result) { JSON.parse(response.body) }

  describe "POST /api/v1/login" do
    let!(:user) { User.create(email: "test@gmail.com", password: "123456", password_confirmation: "123456") }

    before do
      allow(Tokenizer).to receive(:encode)
        .and_return(user)
    end

    it "generates token" do
      post "/api/v1/login", params: { user: { email: "test@gmail.com", password: "123456" } }

      expect(response).to have_http_status(202)
      expect(result["jwt"]).not_to be_nil
      expect(result["user"]["id"]).to eq(user.id)
    end

    context "when incorrect user" do
      it "doesn't generate token" do
        post "/api/v1/login", params: { user: { email: "test@gmail.com", password: "wrong" } }

        expect(response).to have_http_status(401)
        expect(result["jwt"]).to be_nil
      end
    end
  end
end
