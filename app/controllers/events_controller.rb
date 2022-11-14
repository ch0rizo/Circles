class EventsController < ApplicationController

  def new
    @event = Event.new
    @circles = Circle.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.private = params[:event][:private][1]
    if @event.save
      redirect_to root_path, notice: "Event created!"
    else
      redirect_to root_path, notice: "Event not created, please try again"
    end
  end

  def show
    @event = Event.find(params[:id])
    @circles = Circle.all
    @marker =
      {
        lat: @event.latitude,
        lng: @event.longitude
        # info_window: render_to_string(partial: "info_window", locals: {event: event})
      }
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date,  :location, :private, :user_id, circle_ids: [], photos: [])
  end
end
