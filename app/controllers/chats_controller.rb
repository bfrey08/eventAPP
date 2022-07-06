class ChatsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    room = Room.find(params[:room_id])
    attendee = Attendee.find(params[:attendee_id])

    message = Chat.create(message: params[:message], room_id: room.id, attendee_id: attendee.id)
    previous_message = Chat.where('id < ?', message.id).last
    response = ActionCable.server.broadcast("room_#{room.id}", {message: message , attendee: attendee})
    redirect_to event_path
  end
end
