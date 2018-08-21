class EmailsController < ApplicationController
  before_action :set_imap
  require 'fetch_mail'

  def index
    if @mail.login && @mail.fetch_and_store_emails
      @emails = Email.all
    end
  end

  private
    def set_imap
      @mail = FetchMail.new('horribledevelopers@gmail.com', '9811096838', 'imap.gmail.com')
    end
end