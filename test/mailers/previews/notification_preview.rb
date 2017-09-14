# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/room_auth
  def room_auth
    Notification.room_auth
  end

end
