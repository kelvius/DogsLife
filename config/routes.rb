Rails.application.routes.draw do
  get 'breeds/index'
  root "owners#index"

  # get "/owners", to: "owners#index"
  # get "/owners/:id", to: "owners#show"

  resources :owners do
    resources :dogs
  end

  resources :breeds

  # Defines the root path route ("/")
  # root "posts#index"
end
