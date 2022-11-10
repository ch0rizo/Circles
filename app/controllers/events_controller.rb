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
      redirect_to root_path, notice: "Made event successful"
    else
      redirect_to root_path, notice: "Unsuccessful, can't make your circle"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :photo, :location, :private, :user_id, circle_ids: [])
  end
end
