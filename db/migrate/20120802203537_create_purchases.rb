class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :item_price_in_cents, null: false
      t.integer :total_price_in_cents, null: false
      t.integer :item_count, null: false
      t.references :item, null: false
      t.references :purchaser, null: false
      t.references :merchant, null: false
      t.references :purchase_file

      t.timestamps
    end
    add_index :purchases, :item_id
    add_index :purchases, :purchaser_id
    add_index :purchases, :merchant_id
  end
end
