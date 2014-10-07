class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :meal_name
      t.integer :meal_price
      t.string :cuisine_type
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
