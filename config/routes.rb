Rails.application.routes.draw do
  root 'welcome#index'
  resources :auctions # index create edit update destroy
  resources :residences # index create edit update destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
