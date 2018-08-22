class EmailReply < ApplicationRecord
  belongs_to :email
  belongs_to :user
  after_create :set_replied_status

  def set_replied_status
    email.update(status: 'Replied')
  end
end
