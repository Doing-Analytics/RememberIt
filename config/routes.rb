Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'register', to: 'user_registrations#new'
  get 'login' => 'user_sessions#new', :as => :login
  get 'dashboard', to: 'dashboard#show'
  root 'home#show'

  post 'register/user', to: 'user_registrations#create'
  post 'login' => 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
