Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'welcome#index'
  get '/welcome/:attendee_id', to: 'welcome#show'

  get '/verify', to: 'attendee_otp#index'
  post '/verify', to: 'attendee_otp#create'
  get '/verify/:attendee_id', to: 'attendee_otp#show'
  post '/verify/:attendee_id', to: 'attendee_otp#complete_otp'

  get '/events/new', to: 'events#new'
  post '/events/new', to: 'events#create'
  get '/events/:event_id', to: 'events#show'
  get '/events/:event_id', to: 'events#show'

  delete '/events/:event_id/login', to: 'event_sessions#destroy'
  post '/events/:event_id/login', to: 'event_sessions#create'

  get '/events/:event_id/attendees/:attendee_id/login/:api_key', to: 'attendee_sessions#create'

  get '/events/:event_id/attendees/new', to: 'attendees#new'
  post '/events/:event_id/attendees', to: 'attendees#create'
  patch '/events/:event_id/attendees/:attendee_id', to: 'attendees#update'



end
