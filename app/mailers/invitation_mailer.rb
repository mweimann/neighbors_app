class InvitationMailer < ActionMailer::Base
  default from: "postmaster@sandbox19010516b4384e2d951405b7818bc988.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invite_neighbor.subject
  #
  def invite_neighbor(invitation)
    @invitation = invitation
    @greeting = "Howdy, neighbor!"
    mail to: "#{@invitation.recipient_email}", subject:"#{@invitation.sender.username} has invited you to join their group on NeighborShare."
  end
end
