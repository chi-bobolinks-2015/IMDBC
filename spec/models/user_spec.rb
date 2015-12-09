require 'rails_helper'

describe User do
  let (:user) { FactoryGirl.create(:confirmed_user) }

  describe "FactoryGirl setup" do
    it "creates a user" do
      expect(user).to be_a(User)
    end
  end
end
