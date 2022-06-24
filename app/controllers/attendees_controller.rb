class AttendeesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def update
      attendee = Attendee.find(params[:attendee_id])
      attendee.update(rsvp: params[:rsvp])
      attendee.save
      redirect_to "/events/#{attendee.event_id}"
    end

    def create
      names = params[:name].to_a
      phone_numbers = params[:phone_number].to_a
      event = Event.find(params[:event_id])
      attendee_array = []
      attendee_array << names
      attendee_array << phone_numbers
      attendee_data = attendee_array.transpose
      attendee_data.each do |attendee|
        event.attendees.create(name: attendee[0], phone_number: attendee[1])
      end
      redirect_to "/events/#{event.id}"
    end
    def new
      @event = Event.find(params[:event_id])
      @attendee_data = []

    end
end
