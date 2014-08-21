class ModelMailer < ActionMailer::Base
  default from: "postmaster@sandbox19010516b4384e2d951405b7818bc988.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_record_notification(record)
    @record = record
    mail to: "michaelweimann@gmail.com", subject: "Success! You did it."
  end
end
