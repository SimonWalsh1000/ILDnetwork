class CompletionMailer < ApplicationMailer
  def notify_admin_completion(email)
    mail to: "ildgroupproject@gmail.com", subject: "#{email} just completed the form "
  end
end
