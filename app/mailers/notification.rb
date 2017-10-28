class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.room_auth.subject
  #
  def room_auth(room)
  	@room = room
    @greeting = "Hi"

    mail to: "#{@room.user.email}", subject: "Room Authorized #{@room.name}"
  end
  def booking_confirmation(booking)
    @booking = booking 
    @greeting = "Hi"
    mail to: "#{@booking.user.email}", subject: "Room is confirmed by #{@booking.room.user.username}"
  end

  def wait_for_confirmation(booking)
     @booking = booking 
    mail to: "#{@booking.user.email}", subject: "Room is booked for #{@booking.room.user.username} and wait for confirmation"
  end

  def booking_done(booking)
    @booking = booking 
    mail to: "#{@booking.room.user.email}", subject: "Room #{@booking.room.name} is booked by #{@booking.user.username}"
  end
end
