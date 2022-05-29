class SessionsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if event && event.password == params[:editauth]
      session[:event_id] = event.id
    end
    redirect_to session[:return_to]
  end
end
