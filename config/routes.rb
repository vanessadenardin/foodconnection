Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes
  get '/dietaries', to: 'recipes#dietary'
  resources :ratings
  resources :users
  post '/sign-up', to: 'users#sign_up'
  post '/login', to: 'users#login'
  post '/users/:id/enable', to: 'users#enable'
  get '/ingredients', to: 'ingredients#index'

  # test decode token
  post '/token', to: 'users#token'
end
