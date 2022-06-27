class EventSessionsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if event && event.password == params[:editauth]
      session[:event_id] = event.id
    end
    redirect_to session[:return_to]
  end

  def destroy
    cookies.delete(:_event_app_session)
    session.delete(:event_id)
    redirect_to "/events/#{params[:event_id]}"
  end
end
