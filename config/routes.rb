Rails.application.routes.draw do

  get "/sessions/new", to: "sessions#new", as: :sign_in
  get "/auth/failure", to: "identities#authentication_failure"
  post "/auth/:provider/callback", to: "sessions#create"
  get "/sign_out", to: "sessions#destroy", as: :sign_out

  resources :identities, :roles, :users, :collections

  get "/confirmation", to: "home#confirmation"

  namespace :identities do
    resources :password_resets
  end

  root to: "home#index"

end
