class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :renter_id
      t.integer :property_id
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price_paid
    end
  end
end
