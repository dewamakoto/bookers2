Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  root 'home#index'
  resources :books
  resources :users, only: [:show, :edit, :index, :update]
  resources :home, only: [:about, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
