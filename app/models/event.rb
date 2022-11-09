class Event < ApplicationRecord
  has_many :circles
  has_many :users

  belongs_to :user
end
