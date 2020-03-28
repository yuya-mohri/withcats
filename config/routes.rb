Rails.application.routes.draw do
  resources :users, except: [:index, :new, :destroy]
  get 'signup', to: 'users#new'
  resources :items 
  root to: 'items#index'
end
