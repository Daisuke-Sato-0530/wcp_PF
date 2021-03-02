Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/index'
  get 'rankings/new'
  get 'rankings/create'
  get 'rankings/show'
  get 'rankings/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
