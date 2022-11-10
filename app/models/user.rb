class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :circle_messages
  has_many :event_messages
  has_many :user_circles
  has_many :circles, through: :user_circles
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # get all users that are in other circles  
  def friends
    circles = self.circles
    friends = circles.map { |circle| circle.users }.flatten.uniq
    friends.delete(self)
    friends
  end
end
