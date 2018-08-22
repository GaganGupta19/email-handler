class Email < ApplicationRecord
  resourcify
  has_many :email_replies
  belongs_to :user, optional: true
  belongs_to :mail_box, optional: true
  validates_presence_of :body, :subject, :message_id

end
