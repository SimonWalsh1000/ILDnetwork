class CompletedWorker

  include Sidekiq::Worker

  sidekiq_options :retry => 5

  # Informs user followers that user has asked question

  def perform(email)
    CompletionMailer.notify_admin_completion(email).deliver_now
  end

end
