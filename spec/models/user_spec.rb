require 'rails_helper'

describe User do
  let (:user) { FactoryGirl.create(:user) }

  describe "FactoryGirl setup" do
    it "creates a user" do
      expect(user).to be_a(User)
    end
  end
end

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
