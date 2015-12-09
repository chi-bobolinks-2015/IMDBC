require 'rails_helper'

describe MoviesController do
  let!(:movie) { FactoryGirl.create(:movie) }

  describe 'GET #index' do
    it "assigns all movie as @movie" do
      get :index
      expect(assigns(:movies).length).to eq(Movie.all.length)
    end

    context '#search' do
      xit 'should return results' do # how to pass in search params?
        get :index, "search" => {}
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested movie as @movie' do
      get :show, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe 'GET #new' do
    it 'assigns a new movie as @movie' do
      get :new
      expect(assigns(:movie)).to be_a_new Movie
    end
  end

  describe 'POST #create' do
    context 'when valid params are passed' do
      it 'creates a new Movie' do
        expect {post :create, movie: { title: "Jaws", synopsis: "Jaws Attacks", release_date: Faker::Date.between(600.days.ago, Date.today) } }.to change(Movie, :count).by(1)
      end

      it 'assigns newly created movie as @movie' do
        post :create, movie: { title: "Jaws", synopsis: "Jaws Attacks", release_date: Faker::Date.between(600.days.ago, Date.today) }
        expect(assigns(:movie)).to be_a Movie
      end

      it 'redirects to the created movie' do
        response = post :create, movie: { title: "Jaws", synopsis: "Jaws Attacks", release_date: Faker::Date.between(600.days.ago, Date.today) }
        expect(response).to redirect_to(assigns(:movie))
      end
    end

    context 'when invalid params are passed' do
      xit 'rerenders the new template' do # is it possible to pass invalid parameters?
        response = post :create, movie: {}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested movie as @movie' do
      get :show, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing movie' do
      response = patch :update, :id => movie.id, movie: {title: "new title"}
      expect(response).to redirect_to(assigns(:movie))
    end
  end

  describe 'DELETE #destroy' do
    it 'assigns the requested movie as @movie' do
      delete :destroy, { id: movie.to_param }
      expect(assigns(:movie)).to eq(movie)
    end

    it 'destroys the requested movie' do
      expect {delete :destroy, id: movie.id}.to change(Movie, :count).by(-1)
    end

    it 'redirects to the movies list' do
      response = delete :destroy, { id: movie.to_param }
      expect(response).to redirect_to(movies_path)
    end
  end
end
