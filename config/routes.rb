Rails.application.routes.draw do
  resources :beers
  resources :breweries


  root 'breweries#index'


  #Beer relaited routes
  get 'kaikki_bisset', to: 'beers#index'


  #Raitings relaited routes
  get 'raitings', to: 'raitings#index'
  get 'ratings', to: 'raitings#index'
  get 'raitings/new', to:'raitings#new'
  get 'ratings/new', to:'raitings#new'
  post 'raitings' , to: 'raitings#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
