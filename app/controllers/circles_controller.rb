class CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @user_circle = UserCircle.new
    if @circle.save
      @user_circle.user = current_user
      @user_circle.circle = @circle
      @user_circle.save
      redirect_to root_path, notice: 'Nice, your Circle was created!'
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:circle).permit(:name, :description, :photo, :private)
  end
end
