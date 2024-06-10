Rails.application.routes.draw do
  # Api documentation
  apipie

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes

  # /api routes
  namespace :api, defaults: { format: :json } do
    get "public" => "test#public", as: :public
    get "protected" => "test#protected", as: :protected

    resources "sessions", only: [ :create ]

    resources :users do
      resource :profile, only: [ :show, :update ]
    end
    resources :quotes, only: [ :index, :show ]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
