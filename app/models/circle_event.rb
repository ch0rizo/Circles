class CircleEvent < ApplicationRecord
  belongs_to :circle
  belongs_to :event
  validates :circle, uniqueness: {scope: :event}
end
