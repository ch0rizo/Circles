class CircleEventsController < ApplicationController
  def create
    @circle_event = CircleEvent.new
    @circle_event.circle_id = Circle.find(params[:circle_id])
    @circle_event.event_id = 
    @lending.item = Item.find(params[:item_id])

    if @lending.save
      redirect_to items_path, notice: "That's $#{@lending.total}"
    else
      redirect_to dashboard_path, notice: "Can't lend this Item"
    end
  end
end
