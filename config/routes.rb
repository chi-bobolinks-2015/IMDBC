Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'movies#index'

    resources :movies do
      resources :reviews
    end
    get 'users' => 'users#index'
    get 'users/:id' => 'users#show'
end
