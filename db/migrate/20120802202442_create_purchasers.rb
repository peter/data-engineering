class CreatePurchasers < ActiveRecord::Migration
  def change
    create_table :purchasers do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
