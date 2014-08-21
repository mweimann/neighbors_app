require 'test_helper'

class InvitationMailerTest < ActionMailer::TestCase
  test "invite_neighbor" do
    mail = InvitationMailer.invite_neighbor
    assert_equal "Invite neighbor", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
