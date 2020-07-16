Rails.application.routes.draw do

  # User↓========================================================================================
    root            to: "user/top#index"
    get "/shop",    to: "user/top#shop"
    get "/store/:id", to: "user/top#details", as: :details
  # devise↓ =====================================================================================
    devise_for :admins, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    devise_for :masseurs
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_scope :user do
      get "/user/:id", :to => "users/registrations#show", as: :user
    end

    devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      omniauth_callbacks: "users/omniauth_callbacks"
    }
    devise_for :store_managers, :controllers => {
      :registrations => 'store_managers/registrations',
      :sessions => 'store_managers/sessions'
    }
    devise_scope :store_manager do
      get "store_managers/:id", :to => "store_managers/registrations#show", as: "store_managers_show"
      get "store_managers/:id/reservations", :to => "store_managers/registrations#index", as: "store_managers_index"
      get "store_manager/:id/detales", :to => "store_managers/registrations#detales", as: "store_managers_detales"
      get "store_managers/sign_out", :to => "store_managers/sessions#destroy"
    end

    # devise_scope :store_managers do
    #   get "sign_in", :to => "store_managers/sessions#new"
    #   get "sign_out", :to => "store_managers/sessions#destroy"
    # end


    

  # Admin↓========================================================================================
    namespace :admin do
    #  get '/top', to: 'admins#top'
    end

  # Masseur↓========================================================================================
    namespace :masseur do

    end

  # Store_manager↓========================================================================================
    namespace :store_manager do
      get "/:id/top", to: 'top_page#top'
      patch "update_calendar_status", to: 'top_page#update_calendar_status'
      resources :store
      resources :masseurs, except: :show
      resources :plans
    end

    # SmartYoyaku webhook↓==========================================================================
    namespace :smart_yoyaku do
      post "webhook", to: 'webhook#update_order_plan'
    end
    
end
