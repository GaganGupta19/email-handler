class EmployeeMailer < ApplicationMailer
  include EmailRepliesHelper

  def reply(reply_id)
    @reply = EmailReply.find reply_id
    @email = @reply.email
    @sent_email = pre_filled_email_body(@reply.email).html_safe

    mail(to: @reply.to, subject: "Re: #{@email.subject}")
  end
end