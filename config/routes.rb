Rails.application.routes.draw do
devise_for :users
resources :users, only: [:show]
resources :boxes do
  resources :reservations, only: [:create]
end
resources :reservations, only: [:index, :show, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
