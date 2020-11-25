Rails.application.routes.draw do
  root 'books#index'

  # get '/sign_up' , to: 'registrations#new', as: 'registration'
  # post '/users' , to: 'registrations#create'

  # get '/sign_in' , to: 'sessions#new', as: 'session'
  # post '/sign_in' , to: 'sessions#create', as: 'login'
  # delete '/sign_out' , to: 'sessions#destroy', as: 'logout'


  resource :users, controller: 'registrations', only: [:create, :edit, :update] do
    get '/sign_up', action: 'new'
  end

  resource :users, controller: 'sessions', only: [] do
    get '/sign_in', action: 'new'
    post '/sign_in', action: 'create'
    delete '/sign_out', action: 'destroy'
  end

  resources :books do
    resources :posts, shallow: true
  end
end
