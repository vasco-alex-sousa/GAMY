class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
end
