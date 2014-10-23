class ChangeDataTypeForMeals < ActiveRecord::Migration
  	def self.up
   		change_column :meals, :meal_price, :decimal   	
  	end
  	def self.down
	   change_column :meals, :meal_price, :integer
  	end
end
