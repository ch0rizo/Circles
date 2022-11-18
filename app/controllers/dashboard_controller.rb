class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    @all_events = Event.all
    @events = Event.where(user_id: @user)
    @event = @events[0]
    @circles = @user.circles
    @circle = @circles[0]
    @user_event = UserEvent.last
    @next_event = Event.find(@user_event.event_id)
  end
end
