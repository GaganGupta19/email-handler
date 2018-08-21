class FetchMail
  require 'net/imap'
  attr_accessor :imap
  PORT_ADDRESS = 993
  LOGIN_COMMAND = 'LOGIN'
  MAILBOX = 'INBOX'

  def initialize(email, password, imap_address)
    @email = email
    @password = password
    @imap_address = imap_address
  end

  def login
    begin
      @imap = Net::IMAP.new(@imap_address, PORT_ADDRESS, true, nil, false)
      @imap.authenticate(LOGIN_COMMAND, @email, @password)
      @imap.select(MAILBOX)
      return true
    rescue
      return false
    end
  end
end