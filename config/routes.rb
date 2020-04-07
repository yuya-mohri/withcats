Rails.application.routes.draw do
  resources :users, except: [:index, :new, :destroy]
  get 'signup', to: 'users#new'
  
  resources :items do
    member do
      patch :onsale
      patch :not_onsale
    end
  end  
  root to: 'items#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
