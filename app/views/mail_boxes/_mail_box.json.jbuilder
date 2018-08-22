json.extract! mail_box, :id, :smtp_address, :port, :authentication, :domain, :imap_address, :email, :password, :created_at, :updated_at
json.url mail_box_url(mail_box, format: :json)
