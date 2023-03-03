class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @products = Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    elsif params[:product_type]
      @products = Product.where(product_type: params[:product_type])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @bookings = @product.bookings.where("start_date >= ?", Date.today)
    @review = Review.new
    @booking = Booking.new

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @bookings = @bookings.where.not("start_date < ? AND end_date > ?", end_date, start_date)
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    # Upload photo to Cloudinary
    result = Cloudinary::Uploader.upload(params[:product][:photo])
    @product.photo_public_id = result['public_id']

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
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
      redirect_to user_path(current_user), notice: "Product was successfully destroyed."
    else
      redirect_to @product, alert: "You can only delete your own products."
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :product_type, :photo)
  end
end
