Rails.application.routes.draw do
  root "family_owners#index"

  # get "/owners", to: "owners#index"
  # get "/owners/:id", to: "owners#show"

  resources :owners do
    resources :dogs
  end

  resources :about

  resources :breeds

  resources :persons

  resources :gooddogs

  resources :family_owners

  # Defines the root path route ("/")
  # root "posts#index"
end
