Rails.application.routes.draw do
  root "posts#index"

  match "/404", to: "errors#error_404", via: [:get, :post]
  match "/500", to: "errors#error_500", via: [:get, :post]

  resources :sessions, only: [:new, :create, :destroy]
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  resources :posts

  # ActionCable
  mount ActionCable.server => "/cable"
end
