Rails.application.routes.draw do
  get 'session/new'

  get 'session/destroy'

  root 'home#index'

  resources :users

  get '/register' => "users#register"

  # Session maagement
  get  "/login"  => "sessions#new"
  post "/login"  => "sessions#create"
  get  "/logout" => "sessions#destroy", as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
