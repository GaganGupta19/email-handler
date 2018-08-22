class EmailReply < ApplicationRecord
  belongs_to :email
  belongs_to :user
  after_create :send_email

  def set_replied_status
    email.update(status: 'Replied')
  end

  def send_email
    email = EmployeeMailer.reply id
    if self.email.present? && self.email.mail_box.present?
      email.delivery_method.settings.merge!(mail_settings)
      email.deliver
      set_replied_status
    end
  end

  def mail_settings
    {
        :address => email.mail_box.smtp_address,
        :port => 587,
        :domain => email.mail_box.domain,
        :user_name => email.mail_box.email,
        :password => email.mail_box.password,
        :authentication => 'PLAIN'
    }
  end
end
