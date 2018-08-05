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

  resources :users

  get 'dash', to: 'houses#dash'

  root :to => 'houses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
