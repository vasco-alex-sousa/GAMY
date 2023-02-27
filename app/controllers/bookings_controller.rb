class BookingsController < ApplicationController
  def index
    @cart = Cart.where(user_id: current_user.id)
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to carts_path
    else
      render 'index'
    end
  end

  def destroy
    @cart = Cart.where(user_id: current_user.id, product_id: params[:id]).first
    if @cart.destroy
      redirect_to carts_path
    else
      render 'index'
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :user_id)
  end
end
