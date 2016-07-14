class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.string :sku
      t.string :model
      t.float :price
      t.text :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
