Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'
  get '/artists', to: 'artists#index'
end
