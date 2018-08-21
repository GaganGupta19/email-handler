class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.text :body
      t.integer :uid
      t.string :subject
      t.string :from
      t.string :message_id

      t.timestamps
    end
    add_index :emails, :uid
  end
end
