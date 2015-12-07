class AdminWorker

  include Sidekiq::Worker

  sidekiq_options :retry => 5

  # Informs user followers that user has asked question

    def perform(email)
      AdminMailer.notify_admin_sign_up(email).deliver_now
    end

end
