Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'dashboard', to: 'dashboard#show'
  root 'home#show'

  # sorcery
  get 'register', to: 'user_registrations#new'
  get 'login' => 'user_sessions#new', :as => :login
  post 'register/user', to: 'user_registrations#create'
  post 'login' => 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  # team
  resources :teams
end
