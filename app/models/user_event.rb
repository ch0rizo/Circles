class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :payments

  def user_name
    user.first_name
  end
end
