class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rental_id
      t.decimal :value
      t.integer :renter_id
    end
  end
end
