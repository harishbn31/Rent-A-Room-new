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
end
