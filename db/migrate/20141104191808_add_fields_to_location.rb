class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :area, :string
  end
end
