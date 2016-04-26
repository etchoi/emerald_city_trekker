class AddAttachmentProfilePicToProviders < ActiveRecord::Migration
  def self.up
    change_table :providers do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :providers, :profile_pic
  end
end
