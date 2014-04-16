class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :owner_id
      t.string :address
      t.text :description
      t.decimal :price
      t.integer :bedrooms
      t.boolean :long_term
    end
  end
end
