Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, :hackathons, :participants

  post '/participants/create', to: 'participants#create'
end
