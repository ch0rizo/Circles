class CirclesController < ApplicationController
  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(circle_params)
    @user = current_user
    @circle.user = @user
    if @circle.save
      redirect_to circles_path, notice: 'Nice, your Circle was created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def circle_params
    params.require(:circle).permit(:name, :description, :photo, :private)
  end
end
