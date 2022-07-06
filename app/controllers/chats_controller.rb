class ChatsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    room = Room.find(params[:room_id])
    attendee = Attendee.find(params[:attendee_id])

    message = Chat.create(message: params[:message], room_id: room.id, attendee_id: attendee.id)

    RoomChannel.broadcast_to(room, message)

    redirect_to "/events/#{event.id}"
  end
end
