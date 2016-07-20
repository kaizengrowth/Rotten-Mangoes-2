Rails.application.routes.draw do

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do
    resources :users
  end

  get '/search', :controller => 'movies', :action => 'search', :as => 'search'

end
