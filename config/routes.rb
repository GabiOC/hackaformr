Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, :hackathons, :participants, :teams

  post '/participants/create', to: 'participants#create'
  post '/teams/create', to: 'teams#create'
end
