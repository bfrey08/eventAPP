class EventsController < ApplicationController

    def show
      @event = Event.find(params[:event_id])
      session[:return_to] = "/events/#{@event.id}"
    end

    def new
    end

  def create
    event = Event.create(
            name: params['event'],
            pic: params['pic'],
            description: params['desc'],
            location: params['loc'],
            start: params['start'].to_datetime,
            end: params['end'].to_datetime,
            password: params['editpass'], #this is fine
            ban_brian: params['brianban']
            )

    event.password = params['editpass']
    event.save

    host_attendee = event.attendees.create(
        name: params['name'],
        phone_number: params['phone'], #this is also fine
    )

    host_attendee.password = SecureRandom.hex
    host_attendee.save

    redirect_to "/events/#{event.id}"
  end
end
