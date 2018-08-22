class CreateMailBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_boxes do |t|
      t.string :imap_address
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
