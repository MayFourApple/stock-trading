Rails.application.routes.draw do
  devise_for :traders, controllers: {
    sessions: 'traders/sessions',
    registrations: 'traders/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  get 'admin', to: 'admin#index'
  get 'trader', to: 'trader#index'

  namespace :admin do
    resources :traders do
      collection do
        get :pending
      end

      member do
        get :approve
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
