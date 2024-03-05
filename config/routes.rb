Rails.application.routes.draw do
  get "/owners", to: "owners#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
