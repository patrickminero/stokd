class ChangeAttributesToFeatures < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :attributes, :features
  end
end
