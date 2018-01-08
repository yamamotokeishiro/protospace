Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
 　　　　　　resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  get 'newest', to: 'newest#index'
  resources :users, only: [:show, :edit, :update]
end
