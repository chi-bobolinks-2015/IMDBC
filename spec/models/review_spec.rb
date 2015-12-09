require 'rails_helper'

describe Review do
  let(:review) { FactoryGirl.create(:critic_review) }

  describe "FactoryGirl setup" do
    it "creates a review" do
      expect(review).to be_a(Review)
    end
  end
end
