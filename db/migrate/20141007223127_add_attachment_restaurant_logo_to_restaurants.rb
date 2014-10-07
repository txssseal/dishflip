class AddAttachmentRestaurantLogoToRestaurants < ActiveRecord::Migration
  def self.up
    change_table :restaurants do |t|
      t.attachment :restaurant_logo
    end
  end

  def self.down
    remove_attachment :restaurants, :restaurant_logo
  end
end
