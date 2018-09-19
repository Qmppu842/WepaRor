Rails.application.routes.draw do
  resources :users
  resources :beers
  resources :breweries
  resources :raitings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  root 'breweries#index'


  #Beer relaited routes
  get 'kaikki_bisset', to: 'beers#index'


  #Raitings relaited routes
  #get 'raitings', to: 'raitings#index'
  get 'ratings', to: 'raitings#index'
  #get 'raitings/new', to:'raitings#new'
  get 'ratings/new', to:'raitings#new'
  #post 'raitings' , to: 'raitings#create'

  # User relaited things
  get 'signup', to:'users#new'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
