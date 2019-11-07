Rails.application.routes.draw do
  
  root 'welcome#home'
  get '/nuclear', to: 'application#scorched_earth'

  get 'welcome/home', to: 'welcome#home', as: 'welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create_by_login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'musicians#new', as: 'signup'
  post '/signup', to: 'musicians#create'

  resources :instruments do
    resources :pieces, only: [:index, :new, :show, :create, :destroy, :edit] do
      resources :mastery_tracks
    end
  end

  resources :mastery_tracks, only: [:edit, :destroy, :update]

  resources :musicians, only: [:show] do
    resources :instruments, only: [:new]
  end

  match '/auth/github/callback', to: 'sessions#create_by_oauth', via: [:get, :post]

  get '*path' => redirect('/')

end
