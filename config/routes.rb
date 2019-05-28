Rails.application.routes.draw do
resources :boxes
resources :reservations, except: [:update, :edit]
resources :users, except: :index
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
