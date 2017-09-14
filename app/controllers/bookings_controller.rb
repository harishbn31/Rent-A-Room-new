class BookingsController < ApplicationController
	 before_action :authenticate_user!
  load_and_authorize_resource
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role.name == "host"

      @bookings = Booking.all
    else
       @bookings = current_user.bookings
    end
  end

  def create
  	@booking = Booking.new(booking_params)

  	if @booking.save
  		redirect_to @booking.room, notice: "Room has been Booked"
    else
      redirect_to @booking.room, notice: "check date and book agian"
  	end
  end

  def update
    binding.pry
    if @booking.update_attributes(params[:booking].permit(:is_confirmed))
      # Notification.booking_auth(@booking).deliver!
      redirect_to bookings_path, notice: "Successfully updated the booking"
    else
      redirect_to bookings_path
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
      @booking = Booking.find(params[:id])
      # @room = Room.find(params[:id])
    end
end
