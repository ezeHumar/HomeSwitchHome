Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root 'residences#index'
    resources :residences
    resources :auctions
  end


    root 'welcome#index'
  resources :auctions # index create edit update destroy
  resources :residences#, only: [:index] # index create edit update destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
