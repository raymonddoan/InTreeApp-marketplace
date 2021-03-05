Rails.application.routes.draw do
  resources :profiles
  resources :sell_orders
  resources :stocks
  resources :sentiments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
