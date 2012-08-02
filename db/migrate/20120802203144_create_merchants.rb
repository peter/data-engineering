class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
