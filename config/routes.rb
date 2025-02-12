Rails.application.routes.draw do
  # Public routes
  root "home#index"

  get "account_registrations/new"
  get "account_registrations/create"
  get "dashboard/show", as: :dashboard
  get "home/index", as: :home

  # Auth routes
  resource :account_registrations, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :passwords, only: [:new, :create, :update], param: :token

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
