class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :session_uuid
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
