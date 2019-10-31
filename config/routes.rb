Rails.application.routes.draw do
  resources :instruments
  get 'sessions/new'
  get 'sessions/create'
  get 'welcome/home'
  resources :mastery_tracks
  resources :pieces
  resources :musicians
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
