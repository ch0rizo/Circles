class Payment < ApplicationRecord
  belongs_to :user_event
  has_many :splittees
  has_many :user_events, through: :splittees
end
