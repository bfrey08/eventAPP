Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  POST '../events', to: 'events#new'
  POST '../events/:event_id/attendees', to: 'attendees#new'
  PATCH '../events/:event_id/attendees/:attendee_id', to: 'attendees#update'
end
