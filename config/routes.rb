Rails.application.routes.draw do

  resources :rankings, only: [:new, :create, :show, :index]
  resources :items, only: [:new, :create, :show, :index]
  resources :comments, only: [:new, :create, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
