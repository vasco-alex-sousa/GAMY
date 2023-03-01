class Booking < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :review

  validate :no_overlapping_bookings
  enum status: { booked: 0, on_going: 1, finished: 2 }

  def no_overlapping_bookings
    if Booking.where(product_id: product_id)
              .where("start_date <= ? AND end_date >= ?", end_date, start_date)
              .where.not(id: id)
              .exists?
      errors.add(:base, "Overlapping booking exists")
    end
  end
end
