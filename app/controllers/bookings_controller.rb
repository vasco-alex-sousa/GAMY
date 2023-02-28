class BookingsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @booking = @product.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking.product, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.product, notice: 'Booking was successfully destroyed.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
