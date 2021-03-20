Rails.application.routes.draw do

  resources :sell_orders # directs HTTP requests to the SellOrder controller
  resources :stocks # directs HTTP requests to the Stocks controller
  devise_for :users, skip: [:sessions] # maps HTTP requests to devise-generated controller for Users 

  # For future development
  resources :sentiments
  resources :profiles
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "sell_orders#index" # Home to all available sell_orders
  get 'own_orders', to: 'sell_orders#own', as: :own_orders # Shows all of the User's selling orders

  # Routing for successful payments
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

  # Routing for users Login and Signup process
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup', to: 'devise/registrations#new'
  end
end
