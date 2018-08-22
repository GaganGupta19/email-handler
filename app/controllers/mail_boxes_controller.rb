class MailBoxesController < ApplicationController
  before_action :set_mail_box, only: [:show, :edit, :update, :destroy]

  def index
    @mail_boxes = MailBox.all
  end

  def show;end

  def new
    @mail_box = MailBox.new
  end

  def edit;end

  def create
    @mail_box = MailBox.new(mail_box_params)

    respond_to do |format|
      if @mail_box.save
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully created.' }
        format.json { render :show, status: :created, location: @mail_box }
      else
        format.html { render :new }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mail_box.update(mail_box_params)
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_box }
      else
        format.html { render :edit }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mail_box.destroy
    respond_to do |format|
      format.html { redirect_to mail_boxes_url, notice: 'Mail box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_mail_box
      @mail_box = MailBox.find(params[:id])
    end

    def mail_box_params
      params.require(:mail_box).permit(:smtp_address, :port, :authentication, :domain, :imap_address, :email, :password)
    end
end
