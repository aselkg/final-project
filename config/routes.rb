Rails.application.routes.draw do
  root 'products#index'
  get 'home/about'
  devise_for :users
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
