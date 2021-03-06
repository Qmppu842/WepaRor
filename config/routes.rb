Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries do
    post 'toggle_activity', on: :member
  end
  resources :raitings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  # Why recources are not working? I got no idea
  # recources :places, only: [:index, :show]
  root 'breweries#index'

  get 'brewerieslist', to: 'breweries#list'
  get 'brewerylist', to: 'breweries#list'


  #Beer relaited routes
  get 'kaikki_bisset', to: 'beers#index'
  get 'beerlist', to:'beers#list'

  #Raitings relaited routes
  #get 'raitings', to: 'raitings#index'
  get 'ratings', to: 'raitings#index'
  #get 'raitings/new', to:'raitings#new'
  get 'ratings/new', to:'raitings#new'
  #post 'raitings' , to: 'raitings#create'

  # User relaited things
  get 'signup', to:'users#new'
  get 'singup', to:'users#new'
  get 'signin', to: 'sessions#new'
  get 'singin', to: 'sessions#new'
  # Log outers
  delete 'signout', to: 'sessions#destroy'
  delete 'singout', to: 'sessions#destroy'

  # Places relaited things
  get 'places', to: 'places#index'
  post 'places', to: 'places#search'
  get 'places/:id', to:'places#show'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
