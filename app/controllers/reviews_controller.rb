class ReviewsController < ApplicationController
  def create
  @product = Product.find(params[:product_id])
  @booking = Booking.new
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  @review.product_id = @product.id
  if @review.save
    redirect_to product_path(@product)
  else
    render 'products/show'
  end
end


  private

  def review_params
    params.require(:review).permit(:product_id, :rating, :comment)
  end
end
