class CreatePurchasers < ActiveRecord::Migration[7.0]
  def change
    create_table :purchasers do |t|
      t.references :history, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address_line1, null: false
      t.string :address_line2
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
