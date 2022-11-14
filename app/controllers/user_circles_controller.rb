class UserCirclesController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @user_circle = UserCircle.new(user_circle_params)
    @user_circle.circle_id = @circle.id

    if @user_circle.save  
      redirect_to @circle, notice: 'Added friend!'
    else
      raise
      redirect_to @circle, status: :unprocessable_entity
    end
  end

  private
  def user_circle_params
    params.require(:user_circle).permit(:user_id)
  end
end
