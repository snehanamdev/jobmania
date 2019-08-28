Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :seekers
  resources :companies
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
