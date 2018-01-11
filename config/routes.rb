Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :tags, only: [:index, :show, :create, :destroy]
  resources :newest, only: [:index]
  resources :users, only: [:show, :edit, :update]
end
