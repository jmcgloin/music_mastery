class CreateMusicians < ActiveRecord::Migration[6.0]
  def change
    create_table :musicians do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
