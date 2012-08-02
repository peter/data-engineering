class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
