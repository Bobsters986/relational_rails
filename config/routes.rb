Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/venues', to: 'venues#index'
  get '/venues/new', to: 'venues#new'
  post '/venues', to: 'venues#create'
  get '/venues/:id', to: 'venues#show'

  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'
  get '/venues/:venue_id/artists', to: 'venues/artists#index'
end
