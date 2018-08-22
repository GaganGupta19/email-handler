class AddFieldsToMailBoxes < ActiveRecord::Migration[5.1]
  def change
    add_column :mail_boxes, :smtp_address, :string
    add_column :mail_boxes, :port, :integer
    add_column :mail_boxes, :authentication, :string
    add_column :mail_boxes, :domain, :string
  end
end
