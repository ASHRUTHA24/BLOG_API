Rails.application.routes.draw do

  post '/signup', to: 'auth#signup'
  post '/login', to: 'auth#login'


  resources :posts do
    resource :like, only: [:create, :destroy]
  end
end
