class DashboardController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user)
  end
end
