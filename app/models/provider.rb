class Provider < ActiveRecord::Base
  has_secure_password
  has_many :tours, dependent: :destroy
  has_many :requesteds, dependent: :destroy
  has_many :scheduleds, dependent: :delete_all
  has_many :scheduled_tours, through: :tours, source: :scheduled, dependent: :destroy
  has_many :reviews


  has_attached_file :profile_pic, :styles => {
    :large => "450x270!",
    :medium => "320x210!",
    :small => "150x100!"}
  validates_attachment_content_type :profile_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
