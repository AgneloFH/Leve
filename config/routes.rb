Rails.application.routes.draw do
  get "properties/index"
  get "properties/show"
  get "properties/new"
  get "properties/create"
  get "properties/edit"
  get "properties/update"
  get "properties/destroy"
  root 'home#site'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    # Real Estate
    namespace :property do
    resources :property_types
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboards#show', as: :dashboard
    get 'discover', to: 'discovers#index', as: :discover
    get 'chat', to: 'chats#index', as: :chat
    get 'listing', to: 'listings#index', as: :listing
    get 'customer', to: 'customers#index', as: :customer
    get 'analytics', to: 'analytics#index', as: :analytics
    get 'transaction', to: 'transactions#index', as: :transaction
    get 'log_activity', to: 'log_activities#index', as: :log_activity
    get 'settings', to: 'settings#index', as: :settings
    # => Routes Property
    resources :property_types, except: [:show]

      #namespace :real_estate do
      #  namespace :settings do
          # A rota para index de settings
      #    resources :settings, only: :index

       #   namespace :settings do
        #  end
       # end
      #end
    end
  get "up" => "rails/health#show", as: :rails_health_check
end
