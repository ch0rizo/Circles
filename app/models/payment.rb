class Payment < ApplicationRecord
  belongs_to :user_event
  has_many :user_events
end
