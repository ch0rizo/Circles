class EventChatroomChannel < ApplicationCable::Channel
  def subscribed
    event_chatroom = Event.find(params[:id])
    stream_for event_chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
