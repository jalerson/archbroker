class FeedbackMailer < ActionMailer::Base
  default from: "admin@archbroker.com"

  def send_feedback(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(to: "admin@archbroker.com", subject: '[Archbroker] Feedback')
  end
end
