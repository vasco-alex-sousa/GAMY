class BookingsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @booking = @product.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      redirect_to @product
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user), notice: 'Booking was successfully cancelled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
