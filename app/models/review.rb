class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :product

  # validate :review_after_booking_end_date

  # def review_after_booking_end_date
  #   if booking && created_at < booking.end_date
  #     errors.add(:created_at, "must be after booking end date")
  #   end
  # end
end
