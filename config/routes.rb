Rails.application.routes.draw do
  root to: 'pages#home'

  get '/team', to: 'pages#team'

  get '/contact', to: 'pages#contact'

  get '/welcome/:first_name', to: 'pages#welcome'

  resources :gossips

  resources :user, only: [:show]

  resources :city, only: [:show]

  resources :comments

end
