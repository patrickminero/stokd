class AddCategoriesToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :product_categories, :string, array: true, default: []
  end
end
