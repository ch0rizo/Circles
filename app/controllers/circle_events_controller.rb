class CircleEventsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @circle_event = CircleEvent.new(circle_event_params)
    @circle_event.event = @event
    if @circle_event.save
      redirect_to event_path(@event)
    else
      @circles = @event.circles
      render "events/show", status: :unprocessable_entity
    end
  end

  private

  def circle_event_params
    params.require(:circle_event).permit(:circle_id)
  end
end
