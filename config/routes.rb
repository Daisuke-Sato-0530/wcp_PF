Rails.application.routes.draw do

  get 'users/show'
  root :to => 'homes#top'
  
  devise_scope :user do #ゲストログイン用
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  get 'homes/about'
  resources :users
  resources :rankings, only: [:new, :create, :show, :index, :destroy]
  resources :items, only: [:new, :create, :show, :index] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
