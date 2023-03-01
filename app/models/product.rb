class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def booked_for?(user)
    bookings.where(user: user).exists?
  end
end
