require 'rails_helper'

describe Comment do
  let (:movie) { FactoryGirl.create(:movie) }

  describe "FactoryGirl setup" do
    it "creates a movie" do
      expect(movie).to be_a(Movie)
    end
  end
end
