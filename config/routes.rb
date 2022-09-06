Rails.application.routes.draw do
  devise_for :traders
  devise_for :admins

  get 'admin', to: 'admin#index'
  get 'trader', to: 'trader#index'

  namespace :admin do
    resources :traders do
      collection do
        get :pending
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
