class CreatePurchaseFiles < ActiveRecord::Migration
  def change
    create_table :purchase_files do |t|
      t.string :name, null: false
      t.text :contents, null: false
      t.text :processing_errors

      t.timestamps
    end
  end
end
