Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admin, controllers: { registrations: "registrations" }
  resources :users, :hackathons, :admin, :teams

  resources :hackathons do
    resources :teams
  end

  post '/hackathons/create', to: 'hackathons#create'
  post '/users/add_hackathon', to: 'users#add_hackathon'
  post '/users/remove_hackathon', to: 'users#remove_hackathon'
  post '/teams/create', to: 'teams#create'
end
