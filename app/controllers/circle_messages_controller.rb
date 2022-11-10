class CircleMessagesController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    @circle_message = CircleMessage.new(circle_message_params)
    @circle_message.circle = @circle
    @circle_message.user = current_user
    if @circle_message.save
      redirect_to @circle
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def circle_message_params
    params.require(:circle_message).permit(:content)
  end
end
