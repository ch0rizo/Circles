class PaymentsController < ApplicationController

  def new

  end

  def create
    @event = Event.find(params[:event_id])
    @payment = Payment.new(payment_params)
    user = @payment.user_event
    others = @event.user_events.where.not(user: user)
    split_amount = @payment.amount / @event.user_events.count
    user.balance += @payment.amount - split_amount
    user.save
    others.each do |splitee|
      splitee.balance -= split_amount
      splitee.save
    end

    redirect_to event_path(@event)
  end

  private

  def payment_params
    params.require(:payment).permit(:user_event_id, :description, :amount, user_events_ids: [])
  end
end
