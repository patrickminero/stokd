class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :company, null: false, foreign_key: true
      t.text :description
      t.integer :quantity
      t.string :sku
      t.string :name

      t.timestamps
    end
  end
end
