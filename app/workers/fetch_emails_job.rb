class FetchEmailsJob
  include Sidekiq::Worker

  def perform
    MailBox.load_and_fetch_mails
  end
end