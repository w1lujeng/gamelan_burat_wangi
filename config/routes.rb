Rails.application.routes.draw do
  
  root 'home#index'

  resources :users
 
  resources :sessions, only: [:new, :create, :destroy]

  resources :upcomings

  resources :events
  
  get '/login', to: 'sessions#new'

  resources :posts do 
    resources :comments, shallow:true
  end

end
