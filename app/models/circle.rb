class Circle < ApplicationRecord
  has_many :circle_events
  has_many :events, through: :circle_events
  has_many :user_circles
  has_many :users, through: :user_circles
  has_many :circle_messages, dependent: :destroy
  has_one_attached :photo
  has_one_attached :banner
  has_many :circle_playlists

  validates :name, presence: true
  validates :photo, presence: true
  validates :banner, presence: true
  validates :border_color, presence: true
end
