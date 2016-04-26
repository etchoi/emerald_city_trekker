class Provider < ActiveRecord::Base
  has_secure_password

  has_attached_file :profile_pic, :styles => {
    :large => "500x500^",
    :medium => "300x300^",
    :small => "200x200^"}
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
