class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @event = Event.find(params[:event_id])
    session[:return_to] = "/events/#{@event.id}"
    if session[:attendee] && Attendee.find(session[:attendee]).event_id == @event.id
      @attendee = Attendee.find(session[:attendee])
    else
      redirect_to '/'
    end
    @host = @event.attendees.first
    @attendees = @event.attendees.all
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

    host_attendee.update(api_key: SecureRandom.hex)
    host_attendee.save

    primary_room = host_attendee.rooms.create(name: 'primary room')

    redirect_to "/events/#{event.id}/attendees/#{host_attendee.id}/login/#{host_attendee.api_key}"
  end
end
