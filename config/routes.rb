Rails.application.routes.draw do

  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'

  patch '/movies/:movie_id/actors', to: 'movie_actors#update'
end
