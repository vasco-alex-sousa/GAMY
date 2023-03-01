class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @booking = @product.bookings.where(user: current_user).last
    @review_date = @booking ? @booking.end_date + 1.day : nil
    @reviews = @product.reviews
    @bookings = @product.bookings
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new
    end
  end

  def edit
    if current_user != @product.user
      redirect_to @product, alert: "You can only edit your own products."
    end
  end

  def update
    if current_user == @product.user && @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if current_user == @product.user
      @product.destroy
      redirect_to products_url, notice: "Product was successfully destroyed."
    else
      redirect_to @product, alert: "You can only delete your own products."
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end

