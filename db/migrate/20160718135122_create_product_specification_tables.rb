class CreateProductSpecificationTables < ActiveRecord::Migration
  def change
    create_table :product_specification_tables do |t|
      t.string :label
      t.string :content
      t.references :product_specification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
