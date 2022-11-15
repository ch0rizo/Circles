class CircleMessage < ApplicationRecord
  belongs_to :user
  belongs_to :circle

  def sender?(a_user)
    user.id == a_user.id
  end
end
