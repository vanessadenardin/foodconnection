Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  resources :recipes
  get '/dietaries', to: 'recipes#dietary'
  resources :ratings

  post '/sign-up', to: 'users#sign_up'
  post '/login', to: 'users#login'
  # test decode token
  post '/token', to: 'users#token'

end
