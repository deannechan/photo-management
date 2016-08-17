class Photo < ActiveRecord::Base
  belongs_to :customer
  has_attached_file :image,
                :styles => { :small => "150x150>", :large => "320x240>",
                url: "/system/:hash.:extension",
                hash_secret: "abc123" }
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  # validates_attachment_size : photo, :less_than => 5.megabytes

end
