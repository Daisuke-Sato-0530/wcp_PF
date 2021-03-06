Rails.application.routes.draw do

  root :to => 'homes#top'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  get 'homes/about'
  resources :rankings, only: [:new, :create, :show, :index]
  resources :items, only: [:new, :create, :show, :index] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
