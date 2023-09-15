require 'rails_helper'

# frozen_string_literal: true

RSpec.describe User, type: :model  do
  describe "validations" do
    it "validates the presence of user's name" do
      user = User.new(email: 'kamulungaw@example.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "validates the presence of email" do
      user = User.new(name: 'Wilhelm Kamulunga', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
