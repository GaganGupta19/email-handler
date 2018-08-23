class EmailsController < ApplicationController
  before_action :set_imap, only: [:index]
  before_action :get_email, only: [:show, :get_employees, :update]
  require 'fetch_mail'

  def index
    if current_user.has_role? :admin
      @emails = Email.includes(roles: :users).all.order(received_at: :desc)
      flash[:alert] = "Something went wrong" if @imap.blank?
    else
      @emails = Email.includes(roles: :users).with_role(:employee, current_user)
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
      @imap = MailBox.load_and_fetch_mails if current_user.has_role? :admin
    end

    def get_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:user_id)
    end
end