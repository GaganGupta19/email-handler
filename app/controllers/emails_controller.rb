class EmailsController < ApplicationController
  before_action :set_imap, only: [:index]
  after_action :destroy_imap, only: [:index]
  before_action :get_email, only: [:show, :get_employees, :update]
  require 'fetch_mail'

  def index
    if @mail.login
      @mail.fetch_and_store_emails
      if current_user.has_role? :admin
        @emails = Email.all.order(received_at: :desc).preload(:roles)
      else
        @emails = Email.with_role(:employee, current_user).preload(:roles)
      end
    end
  end

  def show;end

  def get_employees
    @employees = User.with_role(:employee)
  end

  def update
    if @email.update(email_params)
      User.find(email_params[:user_id]).add_role :employee, @email
      respond_to do |format|
        format.html { redirect_to emails_path, notice: 'Employee Assignment Successful' }
      end
    end
  end

  private
    def set_imap
      @mail = FetchMail.new('horribledevelopers@gmail.com', '9811096838', 'imap.gmail.com')
    end

    def destroy_imap
      @mail.destroy_imap
    end

    def get_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:user_id)
    end
end