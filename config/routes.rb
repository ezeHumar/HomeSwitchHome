Rails.application.routes.draw do
  resources :annual_payments
  resources :offers

  devise_for :users
  namespace :admin do
    root 'residences#index'
    resources :residences do
      post :country_name, on: :member
    end
    resources :auctions
    resources :users
    resources :edit
    resources :update
  end

    root 'welcome#index'
  resources :auctions do # index create edit update destroy
    post :close, on: :member
    post :reserve, on: :member
    resources :offers

  end
  resources :hotsales do
    post :buy_hotsale, on: :member
  end
  resources :residences do
    get :profile, on: :member
    get :week, on: :member
  end#, only: [:index] # index create edit update destroy
  resources :users do
    post :give_credit, on: :collection
  end
  resources :reservations
  resources :search, only: [:index]
#  resources :update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
