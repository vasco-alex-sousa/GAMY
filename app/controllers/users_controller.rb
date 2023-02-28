class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listings = @user.products
    @bookings = Booking.where(user: current_user)
    redirect_to root_path, alert: "User not found" if @user.nil?
    
  end
end
