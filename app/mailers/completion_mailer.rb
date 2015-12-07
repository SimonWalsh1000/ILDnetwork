class CompletionMailer < ApplicationMailer
  def notify_admin_completion(email)
    mail to: "slfwalsh@gmail.com", subject: "#{email} just completed the form "
  end
end
