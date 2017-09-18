class BookingsController < ApplicationController
	 before_action :authenticate_user!
  load_and_authorize_resource
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
      @bookings = current_user.bookings
    
  end

  def create
  	@booking = Booking.new(booking_params)
    @booking.user_id = current_user.id

  	if @booking.save
       # Notification.booking_done(@booking).deliver!
       # Notification.wait_for_confirmation(@booking).deliver!
  		redirect_to @booking.room, notice: "Room has been Booked"
    else
      redirect_to @booking.room, notice: " #{@booking.errors[:base]}"
  	end
  end

  def update
    if params[:booking][:is_confirmed]
      @booking.update_attributes(is_confirmed: true)
      if @booking.is_confirmed == true
        Notification.booking_confirmation(@booking).deliver!
        redirect_to bookings_path, notice: "Booking Confirmed"
      else
        redirect_to bookings_path, notice: "Wait for Confirmation"
      end
    else
      redirect_to bookings_path, notice: "#{@booking.errors[:base]}"
    end
  end
  def new
  	@booking = Booking.new
  end

  def destroy
      @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, notice: "cancelled the booking"
    end  
  end
  def unconfirmed
    @bookings = Booking.where('is_confirmed = ? ' , false)
  end
  def list
    @bookings = Booking.all
  end

  private
  def booking_params
  	params.require(:booking).permit(:start_date,:end_date,:user_id,:room_id,:is_confirmed)
  end

  def set_booking
      @booking = Booking.find(params[:id])
    end
end
