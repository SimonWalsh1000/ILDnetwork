Rails.application.routes.draw do



  resources :others

  resources :rheumatologists

  get 'home/index'

  resources :users do

    member do
      get :network
    end

    collection do
      get :phys
      get :rad
      get :path
      get :other
      get :rheum
      post :freq
      post :ild
      post :ipf
      post :break
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
