Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes

  # /api routes
  namespace :api, defaults: { format: :json } do
    get "public" => "index#public", as: :public
    get "protected" => "index#protected", as: :protected
    resources "sessions", only: [ :create, :show, :destroy ]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
