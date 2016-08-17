class RemovePictureFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :picture, :string
  end
end
