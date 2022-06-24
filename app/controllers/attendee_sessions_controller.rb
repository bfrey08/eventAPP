class AttendeeSessionsController < ApplicationController
  def create
    attendee = Attendee.find(params[:attendee_id])
    if attendee && attendee.api_key == params[:api_key]
      session[:attendee] = Attendee.find(params[:attendee_id]).id
    end
    redirect_to "/events/#{params[:event_id]}"
  end

end
