Rails.application.routes.draw do
  resources :texts
  resources :links
  resources :file_names
  resources :locations
  resources :tags
  resources :things
  mount Upmin::Engine => '/admin'
  root to: 'home#index'
  devise_for :users
  resources :users
end
