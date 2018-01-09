Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end
  resources :prototypes, only: [:index, :new, :create, :show, :destroy, :edit] do
    resources :comments, only: [:create]
  end
  get 'newest', to: 'newest#index'
  resources :users, only: [:show, :edit, :update]
end
