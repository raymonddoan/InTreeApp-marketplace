Rails.application.routes.draw do

  resources :profiles
  resources :sell_orders
  resources :sentiments
  resources :stocks
  devise_for :users, skip: [:sessions]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "sell_orders#index"

  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup', to: 'devise/registrations#new'
  end
end
