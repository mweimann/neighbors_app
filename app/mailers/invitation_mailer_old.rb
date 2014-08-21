class InvitationMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def invite_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: michaelweimann@gmail.com, subject: 'Welcome to My Awesome Site')
  end
end
