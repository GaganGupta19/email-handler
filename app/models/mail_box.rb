class MailBox < ApplicationRecord
  has_many :emails

  def self.load_and_fetch_mails
    self.all.each do |m|
      fetch_mail = FetchMail.new(m.email, m.password, m.imap_address, m.id)
      fetch_mail.login
      fetch_mail.fetch_and_store_emails
      fetch_mail.destroy_imap
    end
    return true
  end
end
