Rails.application.routes.draw do

  # resources :articles do
  #   resources :comments, shallow: true
  # end


  # resources :articles do
  #   resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]

  



  resources :payments
  resources :rincomes
  resources :deposits
  resources :renters
  resources :weeks
  resources :years
  resources :incomes
  resources :expenses
  resources :houses
  resources :sessions
  resources :users

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'

  #change this later
  # resources :users, :only => [:new, :create, :show]

  get 'dash', to: 'houses#dash'

  root :to => 'houses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
