class BookingsController < ApplicationController
	 before_action :authenticate_user!
  load_and_authorize_resource
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
  	@bookings = Booking.all
  end

  def create
  	@booking = Booking.new(booking_params)
  	if @booking.save
  		redirect_to @booking.room
  	end
  end
  def new
  	@booking = Booking.new
  end

  private
  def booking_params
  	params.require(:booking).permit(:start_date,:end_date,:user_id,:room_id,:is_confirmed)
  end

def set_booking
      @booing = Booking.find(params[:id])
      @room = Room.find(params[:id])
    end
end
