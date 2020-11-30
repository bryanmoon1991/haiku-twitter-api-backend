Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :haikus, only: [:create, :index]
      resources :users, only: [:create, :update, :index, :show]
      resources :favorites, only: [:create, :destroy]
      resources :relationships, only: [:create, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end