Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/dashboard', to: 'users#show'

  resources :locations, only: %i[index show]
end
