class UsersController < ApplicationController
  def show
    if params[:id] == "sign_out"
      sign_out current_user
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @listings = @user.products
      @bookings = Booking.where(user: current_user)
      redirect_to root_path, alert: "User not found" if @user.nil?
    end
  end
end
