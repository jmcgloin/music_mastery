Rails.application.routes.draw do
  resources :instruments
  get 'sessions/new'
  get 'sessions/create'
  get 'welcome/home', to: 'welcome#home', as: 'welcome'
  resources :mastery_tracks
  resources :pieces
  resources :musicians do
  	resources :instruments, only: [:index, :new]
  end

  root 'welcome#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
