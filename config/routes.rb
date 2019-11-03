Rails.application.routes.draw do
  
  root 'welcome#home'

  get 'welcome/home', to: 'welcome#home', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'musicians#new', as: 'signup'
  post '/signup', to: 'musicians#create'

  resources :instruments do
    resources :pieces, only: [:show, :new]
    resources :mastery_tracks, only: [:show, :new]
  end
  resources :mastery_tracks
  resources :pieces
  resources :musicians do
  	resources :instruments, only: [:show, :new]
    resources :pieces, only: [:show, :new]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
