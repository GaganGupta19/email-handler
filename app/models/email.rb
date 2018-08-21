class Email < ApplicationRecord
  validates_presence_of :body, :subject, :message_id
end
