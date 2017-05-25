Rails.application.routes.draw do
  root 'users#main'
  post '/register' => 'users#create'
  post '/login' => 'sessions#create'
  delete '/sessions/:id' => 'sessions#destroy'

  get '/groups' => 'users#show'
  post '/add_group' => 'groups#create'
  get '/groups/:id' => 'groups#show'

  post '/joins/:id' => 'joins#create'
  delete '/joins/:id' => 'joins#destroy'
  delete '/remove/:id' => 'groups#destroy'



end
