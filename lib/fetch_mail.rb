class FetchMail
  require 'net/imap'
  attr_accessor :imap
  PORT_ADDRESS = 993
  #LOGIN_COMMAND = 'LOGIN'
  MAILBOX = 'INBOX'

  def initialize(email, password, imap_address)
    @email = email
    @password = password
    @imap_address = imap_address
  end

  def login
    begin
      @imap = Net::IMAP.new(@imap_address, PORT_ADDRESS, true, nil, false)
      @imap.login(@email, @password)
      @imap.select(MAILBOX)
      return true
    rescue
      return false
    end
  end

  def fetch_all_ids
    begin
      @imap.uid_search('ALL')
    rescue
      []
    end
  end

  def fetch_from_last_id(id)
    begin
      @imap.uid_search("#{id}:*")
    rescue
      []
    end
  end

  def fetch_and_store_emails
    last_email = Email.last
    ids = (last_email.present? ? fetch_from_last_id(last_email.uid) : fetch_all_ids)
    return true if ids.length == 1 && last_email.present? && last_email.uid == ids[0]
    new_ids = ((ids.length > 1 && last_email.present?) ? ids - [last_email.uid] : ids)
    new_ids.each do |id|
      data = fetch_data(id)
      if data.present?
        Email.create(body: data.text_part.body.to_s, subject: data.subject, message_id: data.message_id, uid: id, from: data.from[0])
      end
    end
  end

  def fetch_data(id)
    begin
      Mail.read_from_string @imap.uid_fetch(id, 'RFC822')[0].attr['RFC822']
    rescue
      nil
    end
  end

end