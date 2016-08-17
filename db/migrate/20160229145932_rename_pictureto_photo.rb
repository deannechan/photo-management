class RenamePicturetoPhoto < ActiveRecord::Migration
  def change
     rename_table :pictures, :photos
  end
end
