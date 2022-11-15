class EventsController < ApplicationController

  def new
    @event = Event.new
    @circles = Circle.all
  end

  def create
    @event = Event.new(event_params)
    # raise
    @event.user = current_user
    @event.private = params[:event][:private][1]
    if @event.save
      redirect_to root_path, notice: "Event created!"
    else
      redirect_to root_path, notice: "Event not created, please try again"
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find(params[:id])
    @event_message = EventMessage.new
    @circles = @event.circles
    @circle_event = CircleEvent.new
    @marker = Event.where(id: params[:id]).geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
        # info_window: render_to_string(partial: "info_window", locals: {event: event})
      }
    end
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :location, :private, :user_id, circle_ids: [], photos: [], images: [])
  end
end
