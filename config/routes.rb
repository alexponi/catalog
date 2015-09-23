Rails.application.routes.draw do
  resources :links
  resources :file_names
  resources :locations
  resources :tags
  resources :things
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
