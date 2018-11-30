Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root 'residences#index'
    resources :residences
    resources :auctions
    resources :users
    resources :edit
    resources :update
  end


    root 'welcome#index'
  resources :auctions # index create edit update destroy
  resources :residences do
    get :profile, on: :member
    get :week, on: :member
  end#, only: [:index] # index create edit update destroy
  resources :users
  resources :reservations
#  resources :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
