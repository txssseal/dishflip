class AddAttachmentMealPhotoToMeals < ActiveRecord::Migration
  def self.up
    change_table :meals do |t|
      t.attachment :meal_photo
    end
  end

  def self.down
    remove_attachment :meals, :meal_photo
  end
end
