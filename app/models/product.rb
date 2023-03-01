class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  attribute :product_type, :string

  def booked_for?(user)
    bookings.where(user: user).exists?
  end

  def average_rating
    reviews.average(:rating)
  end
end
