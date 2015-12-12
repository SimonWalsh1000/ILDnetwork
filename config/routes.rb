Rails.application.routes.draw do

  require 'sidekiq/web'

  authenticate do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :others

  resources :rheumatologists

  get 'home/index'

  resources :users do

    member do
      get :network
      post :nation
    end

    collection do
      get :admin
    end

    resources :physicians

    resources :paths

    resources :rads

  end

  devise_for :members, controllers: {registrations: 'members/registrations',
                                     sessions: 'members/sessions' }

  devise_scope :member do
    authenticated :member do
      root :to => 'home#index', as: :authenticated_root
    end
    unauthenticated :member do
      root :to => 'members/registrations#new', as: :unauthenticated_root
    end
  end

end
