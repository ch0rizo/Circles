class UsersController < ApplicationController
  def profile
    @events = Event.all
  end

  def index
    @users = User.all

    if params[:query].present?
      @users = @users.where("username ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: "circles/users_list", locals: { users: @users }, formats: [:html] }
    end
  end
end
