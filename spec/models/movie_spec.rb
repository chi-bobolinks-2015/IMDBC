require 'rails_helper'

describe Movie do
  let (:movie) { FactoryGirl.create(:movie) }

  describe "FactoryGirl setup" do
    it "creates a movie" do
      expect(movie).to be_a(Movie)
    end
  end
end

RSpec.describe Movie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
