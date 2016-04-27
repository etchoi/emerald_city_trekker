class Tour < ActiveRecord::Base
  belongs_to :provider

  has_attached_file :tour_pic, :styles => {
    :large => "380x300!",
    :medium => "281x200!",
    :small => "100x100!"}
  validates_attachment_content_type :tour_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
