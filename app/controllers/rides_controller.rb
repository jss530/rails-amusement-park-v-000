class RidesController < ApplicationController
  before_action :set_user, only: [:show]


  def create
    @ride = Ride.new(:attraction_id => params[:attraction_id], :user_id => params[:user_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user.id), notice: @message
  end

  def show
  end


  private

   def set_user
      @user = User.find(session[:user_id])
    end
end
