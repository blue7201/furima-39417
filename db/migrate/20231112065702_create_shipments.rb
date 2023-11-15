class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :postalcode, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
