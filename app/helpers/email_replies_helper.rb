module EmailRepliesHelper

  def pre_filled_email_body(email)
    text = '<br><p>-----------------------------</p>'
    text << '<b>Reply for : </b><br>'
    text << "<p><b>Received at : </b>#{email.received_at}<br>"
    text << "<p>#{email.body}</p>"
    text.html_safe
  end

end