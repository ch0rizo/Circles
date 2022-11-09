class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_events
  has_many :events, through: :user_events
  has_many :circle_messages
  has_many :event_messages
  has_many :user_circles
  has_many :circles, through: :user_circles
end
