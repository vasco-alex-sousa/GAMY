class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.find_by(user: current_user, product: @product)
    if @booking.present?
      @review = @booking.reviews.build(review_params)
      if @review.save
        redirect_to product_path(@product)
      else
        redirect_to product_path(@product), alert: "You need to book this product before you can review it."
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :rating, :comment)
  end
end
