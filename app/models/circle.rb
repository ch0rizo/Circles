class Circle < ApplicationRecord
  has_many :circle_events
  has_many :events, through: :circle_events
  has_many :user_circles
  has_many :users, through: :user_circles
  has_many :circle_messages, dependent: :destroy
  has_one_attached :photo
end
