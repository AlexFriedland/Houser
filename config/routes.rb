Rails.application.routes.draw do
  resources :payments
  resources :rental_incomes
  resources :deposits
  resources :renters
  resources :weeks
  resources :years
  resources :incomes
  resources :expenses
  resources :houses

  root :to => 'houses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
