class UsersController < ApplicationController
  def profile
    @events = Event.all
  end

  def index
    @users = User.all
    @circle = Circle.find(params[:circle_id])

    if params[:query].present?
      @users = @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "circles/users_list", locals: { users: @users, circle: @circle }, formats: [:html] }
    end
  end
end
