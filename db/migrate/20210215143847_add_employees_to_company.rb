class AddEmployeesToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :employees, :string, array: true, default: []
  end
end
