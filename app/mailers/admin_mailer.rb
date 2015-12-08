class AdminMailer < ApplicationMailer
  def notify_admin_sign_up(email)
    mail to: "ildgroupproject@gmail.com", subject: "#{email} just signed in "
  end
end
