class AddFieldsToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :email, :string
    add_column :restaurants, :website, :string
    add_column :restaurants, :facebook, :string
  end
end
