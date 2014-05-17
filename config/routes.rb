Rails.application.routes.draw do
  get '/register', to: 'users#new', as: :register # (register_path)
  post '/users', to: 'users#create', as: :users # (users_path)
  get '/login', to: 'sessions#new', as: :login # (login_path)
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
