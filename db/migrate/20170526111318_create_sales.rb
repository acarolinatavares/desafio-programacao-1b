class CreateSales < ActiveRecord::Migration[5.0]
  create_table :sales do |t|
    t.string :buyer
    t.string :description
    t.string :address
    t.string :provider
    t.decimal :price, precision: 9, scale: 2
    t.integer :quantity

    t.timestamps
  end
end
