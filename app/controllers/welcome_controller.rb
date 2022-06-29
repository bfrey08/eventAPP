class WelcomeController < ApplicationController
  def index
    @attendee_id = session[:attendee]
  end

  def show
    attendee = Attendee.find(params[:attendee_id])
    @attendees = Attendee.where(phone_number: attendee.phone_number)
    if @attendees.count == 1
      attendee = @attendees.first
      redirect_to "/events/#{attendee.event.id}/attendees/#{attendee.id}/login/#{attendee.api_key}"
    end
  end
end
