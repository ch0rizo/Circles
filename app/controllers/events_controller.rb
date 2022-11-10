class EventsController < ApplicationController

  def new
    @event = Event.new
    @circles = Circle.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

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
    params.require(:event).permit(:title, circle_ids: [])
  end
end
