class AddRentedToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :rented, :boolean
  end
end
