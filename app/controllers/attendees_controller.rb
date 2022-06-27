class AttendeesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def update
      attendee = Attendee.find(params[:attendee_id])
      attendee.update(rsvp: params[:rsvp])
      attendee.save
      redirect_to "/events/#{attendee.event_id}"
    end

    def create
      event = Event.find(params[:event_id])
      names = params[:name].to_a
      phone_numbers = params[:phone_number].to_a
      attendee_array = []
      attendee_array << names
      attendee_array << phone_numbers
      attendee_array << Array.new(names.count, SecureRandom.hex)
      attendee_data = attendee_array.transpose
      array_of_hash = attendee_data.map do |attendee|
        [[:name, :phone_number, :api_key], attendee].transpose.to_h
      end


      attendee_list = event.attendees.create(array_of_hash)
      TwilioService.create_message(attendee_list)

      redirect_to "/events/#{event.id}"
    end

    def new
      @event = Event.find(params[:event_id])
      @attendee_data = []
    end

    private

    def attendee_params
      params.permit(:name, :phone_number)
    end
end
