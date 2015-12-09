require 'rails_helper'

describe ReviewsController do
  let!(:review) { FactoryGirl.create(:critic_review)}

  describe 'GET #show' do
    it 'assigns the requesed review as @review' do
      get :show, { movie_id: review.movie_id, id: review.to_param }
      expect(assigns(:review)).to eq(review)
    end
  end

  describe 'GET #new' do
    it 'assigns a new review as @review' do
      get :new, { movie_id: FactoryGirl.create(:movie) }
      expect(assigns(:review)).to be_a_new Review
    end
  end

  describe 'POST #create' do
    context 'when valid params are passed' do
      it 'creates a new Review' do
        movie = FactoryGirl.create(:movie)
        review_attributes = FactoryGirl.attributes_for(:review)
        expect {post :create, :movie_id => movie, :review => review_attributes}
      end

      it 'assigns newly created review as @review' do
        movie = FactoryGirl.create(:movie)
        review_attributes = FactoryGirl.attributes_for(:review)
        post :create, :movie_id => movie, :review => review_attributes
        expect(assigns(:review)).to be_a Review
      end

      it 'redirects to the movie' do
        movie = FactoryGirl.create(:movie)
        review_attributes = FactoryGirl.attributes_for(:review)
        response = post :create, :movie_id => movie, :review => review_attributes
        expect(response).to redirect_to(movie)
      end
    end
    context 'when invalid params are passed' do
      xit 'rerenders the new template' do
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested review as @review' do
      get :edit, { movie_id: review.movie_id, id: review.to_param }
      expect(assigns(:review)).to eq(review)
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing review' do
      movie = review.movie
      review_attributes = FactoryGirl.attributes_for(:review)
      response = patch :update, :movie_id => movie.id, :id => review.id, review: review_attributes
      expect(response).to redirect_to(movie_review(review))
    end
  end
end
