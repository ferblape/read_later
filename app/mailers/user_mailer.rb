class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def deliver_summary(options)
    email = options.fetch(:email)
    summary = options.fetch(:summary)

    @title = summary.title
    @body = summary.body
    @url = summary.url

    mail to: email, subject: %Q{Read later email for article "#{summary.title}"}
  end

end
