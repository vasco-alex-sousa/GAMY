class Product < ApplicationRecord
  belongs_to :category
  has_many :bookings
  has_many :reviews
end
