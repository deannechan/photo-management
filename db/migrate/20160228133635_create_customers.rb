class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :picture
      t.string :contactNumber

      t.timestamps null: false
    end
  end
end
