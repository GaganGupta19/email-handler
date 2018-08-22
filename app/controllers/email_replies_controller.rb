class EmailRepliesController < ApplicationController
  before_action :get_email

  def new
    @email_reply = EmailReply.new
  end

  def create
    respond_to do |format|
      #@email.email_replies.create!(email_reply_params)
      format.html { redirect_to emails_path, notice: 'Mail Successfully Sent.' }
    end
  end

  private
    def get_email
      @email = Email.find(params[:email_id])
    end

    def email_reply_params
      params.require(:email_reply).permit(:user_id, :to, :body)
    end
end