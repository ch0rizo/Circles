class EventMessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_message = EventMessage.new(event_message_params)
    @event_message.event = @event
    @event_message.user = current_user
    if @event_message.save
      EventChatroomChannel.broadcast_to(
        @event,
        render_to_string(partial: "event_message", locals: {event_message: @event_message})
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def event_message_params
    params.require(:event_message).permit(:content)
  end
end
