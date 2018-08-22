class CreateEmailReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :email_replies do |t|
      t.text :body
      t.references :email, foreign_key: true, index: true
      t.string :to
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
