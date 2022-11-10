class CirclesController < ApplicationController
  def new
    @circle = Circle.new
    @users = current_user.friends
    @user_names = @users.pluck(:first_name)
  end

  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      @circle.users << current_user
      redirect_to @circle, notice: 'Successfully made your circle!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @circle = Circle.find(params[:id])
    # @circle = @user_circle.circle
    # @circle_event = CircleEvent.find(circle.id)

  end


  private
  def circle_params
    params.require(:circle).permit(:name, :description, :photo, :private, user_ids: [])
  end
end
