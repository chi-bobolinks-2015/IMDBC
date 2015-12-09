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

  context 'when a critic has made reviews of a movie' do
    let!(:review) { FactoryGirl.create(:user_review)}
    let(:movie) { Movie.find(review.movie_id) }

    describe "#critic_reviews" do
      it 'returns all reviews created by a critic' do
        expect(movie.user_reviews).to include(review)
      end
    end
  end

  describe "#average_ratingz" do
    it "returns an average critic rating" do
      critic1 = FactoryGirl.create(:confirmed_critic)
      Rate.create(rater: critic1, rateable: movie, rateable_type: "Movie", dimension: "overall", stars: 2)
      critic2 = FactoryGirl.create(:confirmed_critic)
      Rate.create(rater: critic2, rateable: movie, rateable_type: "Movie", dimension: "overall", stars: 4)

      expect(movie.average_ratingz(true)).to eq(3)
    end

    it "rounds ratings to 2 decimal places" do
      critic1 = FactoryGirl.create(:confirmed_critic)
      Rate.create(rater: critic1, rateable: movie, rateable_type: "Movie", dimension: "overall", stars: 4)
      critic2 = FactoryGirl.create(:confirmed_critic)
      Rate.create(rater: critic2, rateable: movie, rateable_type: "Movie", dimension: "overall", stars: 3)
      critic3 = FactoryGirl.create(:confirmed_critic)
      Rate.create(rater: critic3, rateable: movie, rateable_type: "Movie", dimension: "overall", stars: 3)

      expect(movie.average_ratingz(true)).to eq(3.33)
    end
  end
end
