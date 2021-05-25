require 'rails_helper'

RSpec.describe Tokenizer, type: :service do
  let!(:user) { User.create(email: "test@gmail.com", password: "123456", password_confirmation: "123456") }

  describe ".encode" do
    before do
      allow(JWT).to receive(:encode)
        .with({ user_id: user.id }, described_class::SECRET)
        .and_return("my-token")
    end

    it "encodes" do
      expect(described_class.encode(user))
        .to eq("my-token")
    end
  end

  describe ".decode" do
    before do
      allow(JWT).to receive(:decode)
        .with("my-token", described_class::SECRET, true, algorithm: "HS256")
        .and_return([{ "user_id" => user.id }])
    end

    it "decodes" do
      expect(described_class.decode("Bearer my-token"))
        .to eq(user)
    end

    context "when invalid token" do
      before do
        allow(JWT).to receive(:decode)
          .and_raise(JWT::DecodeError)
      end

      it "return nil" do
        expect(described_class.decode("Bearer my-token"))
          .to be_nil
      end
    end
  end
end
