require 'rails_helper'

describe Movie do
  let!(:movie) { FactoryGirl.create(:movie) }

  describe "FactoryGirl setup" do
    it "creates a movie" do
      expect(movie).to be_a(Movie)
    end
  end

  describe "#search" do
    it "searches for like titles" do
      expect(described_class.search("Jaws").size).to eq(1)
    end

    it "case insensitive searches" do
      expect(described_class.search("jaws").size).to eq(1)
    end
  end

  context 'when a critic has made reviews of a movie' do
    let!(:review) { FactoryGirl.create(:critic_review)}
    let(:movie) { Movie.find(review.movie_id) }

    describe "#critic_reviews" do
      it 'returns all reviews created by a critic' do
        expect(movie.critic_reviews).to include(review)
      end
    end
  end
end
