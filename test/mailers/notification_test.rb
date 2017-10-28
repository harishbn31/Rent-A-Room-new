require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "room_auth" do
    mail = Notification.room_auth
    assert_equal "Room auth", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
