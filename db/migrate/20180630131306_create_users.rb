class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :name
      t.string :password_digest
      t.boolean :is_feed_private, default: true
      
      t.timestamps
    end
  end
end
