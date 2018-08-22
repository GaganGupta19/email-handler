class AddFieldsToMails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :received_at, :datetime
    add_column :emails, :status, :string
    add_reference :emails, :mail_box, foreign_key: true, index: true
    add_reference :emails, :user, foreign_key: true, index: true
  end
end
