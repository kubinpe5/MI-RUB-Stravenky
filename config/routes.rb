Rails.application.routes.draw do
  devise_for :users
  root to: 'tickets#index'
  resources :tickets, only: [:index, :update]
  get 'users' => 'users#index'
end
