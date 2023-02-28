class BookingsController < ApplicationController
  def index
    @booking = Booking.where(user_id: current_user.id)
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render 'index'
    end
  end

  def destroy
    @booking = Booking.where(user_id: current_user.id, product_id: params[:id]).first
    if @booking.destroy
      redirect_to bookings_path
    else
      render 'index'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:product_id, :user_id)
  end
end
