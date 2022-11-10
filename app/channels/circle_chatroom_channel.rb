class CircleChatroomChannel < ApplicationCable::Channel
  def subscribed
    circle_chatroom = Circle.find(params[:id])
    stream_for circle_chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
