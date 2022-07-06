class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "RoomsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
