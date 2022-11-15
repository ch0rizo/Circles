class EventMessage < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def sender?(a_user)
    user.id == a_user.id
  end
end
