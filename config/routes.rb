Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :movies
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'movies#index'

  resources :movies do
    resources :reviews do
      resources :comments, only: [:new, :create]
    end
  end
  get 'users' => 'users#index',
      as: 'users'
  get 'users/:id' => 'users#show',
      as: 'user'

end
