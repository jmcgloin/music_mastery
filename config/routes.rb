Rails.application.routes.draw do
  
  root 'welcome#home'
  get '/nuclear', to: 'application#scorched_earth'

  get 'welcome/home', to: 'welcome#home', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'musicians#new', as: 'signup'
  post '/signup', to: 'musicians#create'
  get '/instrument/:instrument_id/pieces', to: 'pieces#instrument', as: 'piece_instrument'

  resources :instruments do
    resources :mastery_tracks, only: [:show, :new]
  end

  resources :mastery_tracks do
    resources :pieces, only: [:new, :show]
  end

  resources :pieces

  resources :musicians do
  	resources :instruments, only: [:show, :new]
  end

end
