class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :reviews, through: :product

  validate :booking_dates_available

  def booking_dates_available
    if product.bookings.where("start_date <= ? AND end_date >= ?", end_date, start_date).any?
      errors.add(:base, "Dates not available")
    end
  end
end
