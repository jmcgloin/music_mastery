Rails.application.routes.draw do
  
  root 'welcome#home'

  get 'welcome/home', to: 'welcome#home', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/signup', to: 'musicians#new', as: 'signup'
  post '/signup', to: 'musicians#create'

  resources :instruments
  resources :mastery_tracks
  resources :pieces
  resources :musicians do
  	resources :instruments, only: [:index, :new]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
