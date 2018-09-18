Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'users#show', as: 'user'
  get '/', to: 'application#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout',to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  # campsite routes
  resources :campsites, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments
  end
  
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
  get '/best_campsite', to: 'favorites#most_favorite'
  get '/favorites_with_notes', to: 'favorites#fav_with_notes'
  get '/search', to: 'campsites#search'
  get '/list', to: 'comments#list'
end


