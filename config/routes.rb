Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/events/new', to: 'events#new'
  post '/events/new', to: 'events#create'
  get '/events/:event_id', to: 'events#show'
  post '/events/:event_id/attendees', to: 'attendees#new'
  patch '/events/:event_id/attendees/:attendee_id', to: 'attendees#update'

  post '/login', to: 'sessions#create'
end
