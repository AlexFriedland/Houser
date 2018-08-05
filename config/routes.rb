Rails.application.routes.draw do
  resources :payments
  resources :rincomes
  resources :deposits
  resources :renters
  resources :weeks
  resources :years
  resources :incomes
  resources :expenses
  resources :houses

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  #change this later
  resources :users, :only => [:new, :create]

  get 'dash', to: 'houses#dash'

  root :to => 'houses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
