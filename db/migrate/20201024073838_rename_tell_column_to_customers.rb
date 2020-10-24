class RenameTellColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :tell, :telephone_number
  end
end
