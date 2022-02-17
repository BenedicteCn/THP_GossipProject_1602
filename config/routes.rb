Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root to: 'pages#home'

  get '/team', to: 'pages#team'

  get '/contact', to: 'pages#contact'

  get '/welcome/:first_name', to: 'pages#welcome'

  resources :gossips do
    resources :comment
  end

  resources :user

  resources :city, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]

end
