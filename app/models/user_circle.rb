class UserCircle < ApplicationRecord
  belongs_to :user
  belongs_to :circle

  validates :user_id, uniqueness: { scope: :circle_id }
end
