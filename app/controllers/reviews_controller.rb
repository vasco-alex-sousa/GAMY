class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@review.product)
    else
      render 'products/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:product_id, :rating, :comment)
    end
end
