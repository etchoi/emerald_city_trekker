class AddAttachmentTourPicToTours < ActiveRecord::Migration
  def self.up
    change_table :tours do |t|
      t.attachment :tour_pic
    end
  end

  def self.down
    remove_attachment :tours, :tour_pic
  end
end
