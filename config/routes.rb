Rails.application.routes.draw do
  get 'persons/index'
  get 'about/index'
  get 'breeds/index'
  root "owners#index"

  # get "/owners", to: "owners#index"
  # get "/owners/:id", to: "owners#show"

  resources :owners do
    resources :dogs
  end

  resources :about

  resources :breeds

  resources :persons

  resources :gooddogs

  # Defines the root path route ("/")
  # root "posts#index"
end
