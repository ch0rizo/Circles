class UserEventsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.new(event: @event, user: current_user)
    
    if @user_event.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.json { render json: { user_count: @event.users.count } }
      end
    else
      format.html { redirect_to @event, notice: "Something went wrong" }
      format.json { render json: { user_count: @event.users.count } }
    end
  end
end