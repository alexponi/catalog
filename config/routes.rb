Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :texts
  resources :links
  resources :file_names
  resources :locations
  resources :tags
  resources :things
  mount Upmin::Engine => '/admin'
  root to: 'home#index'
  get 'search', to: 'home#index'
  devise_for :users
  resources :users
end
