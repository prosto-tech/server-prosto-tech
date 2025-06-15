# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: :index
      resources :favourites, only: %i[index create destroy]
      resources :items, only: %i[index  show destroy]
      resources :reserves, only: %i[index destroy]
      post 'add_item', to: 'items#create'
      post 'reserve', to: 'reserves#create'
      post 'login', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end

  resources :users, only: :index
  resources :favourites, only: %i[index create destroy]
  resources :items, only: %i[index  show destroy]
  resources :reserves, only: %i[index destroy]
  post 'add_item', to: 'items#create'
  post 'reserve', to: 'reserves#create'
  post 'login', to: 'authentication#create'
  post 'register', to: 'users#create'
end
