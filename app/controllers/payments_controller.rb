class PaymentsController < ApplicationController

  def new

  end

  def create
    @event = Event.find(params[:event_id])
    payment = Payment.new(payment_params)
    payment.save
    splittees = payment.user_events
    payer = payment.user_event
    split_amount = payment.amount / (splittees.count + 1)
    payer.balance += payment.amount - split_amount
    payer.save
    splittees.each do |splittee|
      splittee.balance -= split_amount
      splittee.save
    end

    redirect_to event_path(@event)
  end

  private

  def payment_params
    params.require(:payment).permit(:user_event_id, :description, :amount, user_event_ids: [])
  end
end
