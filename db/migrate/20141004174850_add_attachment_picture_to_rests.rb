class AddAttachmentPictureToRests < ActiveRecord::Migration
  def self.up
    change_table :rests do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :rests, :picture
  end
end
