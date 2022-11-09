class Circle < ApplicationRecord
  has_many :users
  # has_many :events, dependent: :destroy
end
