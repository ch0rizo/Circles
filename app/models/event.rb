class Event < ApplicationRecord
  has_many :circles
  has_many :users

  belongs_to :user
  has_many :user_events
  has_many :users, through: :user_events
  has_many :circle_events
  has_many :circles, through: :circle_events
  has_many :event_messages, dependent: :destroy
end