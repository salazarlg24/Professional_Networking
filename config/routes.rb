Rails.application.routes.draw do
# *************** PENDING ROUTES *****************
  get '/pendings/:id' => 'pendings#create' 

  get '/pendings' => 'pendings#destroy'

# *************** NETWORK ROUTES *****************
	get '/professional_profile' => 'networks#index'

	get '/user_profile/' => 'networks#index'

	get 'networks/:id' => 'networks#create'

	get 'networks/destroy'

# *************** USER ROUTES *****************
  root 'users#index'

  get '/users' => 'users#show'

  get '/users/:id' => 'users#profile'

  get '/users/:id/edit' => 'users#edit'

  post '/login' =>'users#login'

  post '/register' => 'users#register'

  patch '/users' => 'users#update'

  get '/logout' => 'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
