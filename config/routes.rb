Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'registrations' }

  get '/splash', to: 'splashes#index'

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
    end

    unauthenticated do
      root "splashes#index", as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show, :new] do
    resources :categories, only: [:new, :create, :show, :index, :destroy]
    resources :expenses, only: [:new, :create, :index, :show, :destroy]
  end
end
