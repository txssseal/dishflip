class CreateRests < ActiveRecord::Migration
  def change
    create_table :rests do |t|
      t.string :restaurant_name
      t.string :meal_name
      t.integer :meal_price
      t.string :restaurant_area
      t.string :restaurant_address
      t.string :cuisine_type

      t.timestamps
    end
  end
end
