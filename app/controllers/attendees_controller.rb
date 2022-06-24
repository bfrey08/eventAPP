class AttendeesController < ApplicationController
    def update
      attendee = Attendee.find(params[:attendee_id])
      attendee.update(rsvp: params[:rsvp])
      attendee.save
      redirect_to "/events/#{attendee.event_id}"
    end
end
