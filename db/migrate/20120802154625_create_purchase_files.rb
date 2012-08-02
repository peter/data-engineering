class CreatePurchaseFiles < ActiveRecord::Migration
  def change
    create_table :purchase_files do |t|
      t.string :name
      t.text :contents
      t.text :processing_errors

      t.timestamps
    end
  end
end
