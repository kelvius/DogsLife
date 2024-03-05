Rails.application.routes.draw do
  root "owners#index"

  # get "/owners", to: "owners#index"
  # get "/owners/:id", to: "owners#show"

  resources :owners

  # Defines the root path route ("/")
  # root "posts#index"
end
