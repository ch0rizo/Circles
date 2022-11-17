class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    @users = current_user.friends
    @user_names = @users.pluck(:first_name)
    @colors = %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff]
  end

  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      @circle.users << current_user
      # params[:circle]["user_ids"].each do |friend|
      #   @circle.users << User.find_by(first_name: friend) if friend != ""
      # end
      redirect_to @circle, notice: 'New Circle created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @users = User.all
    @circle = Circle.find(params[:id])
    @circle_events = CircleEvent.where(@circle_id)
    @circle_message = CircleMessage.new
    @user_circle = UserCircle.new
    @not_in_group_users = User.where.not(id: @circle.users.map(&:id))
    @other_users = @circle.users.reject { |user| user == current_user }
    @circle_playlist = CirclePlaylist.new
  end

  def destroy
    @circle = Circle.find(params[:id])
    if current_user == @circle.user
      @circle.destroy
    end

    redirect_to root_path
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :description, :photo, :private, :border_color, :banner, user_ids: [])
  end
end
