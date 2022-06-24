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
      attendee_data.each do |attendee_data|
        api_key = SecureRandom.hex
        attendee = event.attendees.create(name: attendee_data[0], phone_number: attendee_data[1], api_key: api_key)
        body = "you are invited to '#{event.name}' by #{event.attendees.first.name}, join us: http://localhost:3000/events/#{event.id}/attendees/#{attendee.id}/login/#{api_key}"
        TwilioService.create_message(attendee.phone_number, body) if Rails.application.credentials.twilio_account_SID
      end
      redirect_to "/events/#{event.id}"
    end

    def new
      @event = Event.find(params[:event_id])
      @attendee_data = []
    end
end
