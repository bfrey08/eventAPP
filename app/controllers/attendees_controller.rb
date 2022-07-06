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
      attendee_data = attendee_params.each do |attendee|
        attendee[:api_key] = SecureRandom.hex
      end

      attendee_list = event.attendees.create(attendee_data)

      attendee_ids = attendee_list.map { |attendee| attendee.id}
      attendee_list.each do |attendee|
        Chat.create!(message: nil, attendee_id: attendee.id, room_id: event.rooms.find_by(name: "primary room").id)
      end
      TwilioService.create_message(attendee_list)

      redirect_to "/events/#{event.id}"
    end

    def new
      @event = Event.find(params[:event_id])
      @attendee_data = []
    end

    private

    def attendee_params
      params.permit(:attendee => [:name, :phone_number]).to_h[:attendee]
    end
end
