class AddTellToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :tell, :string
  end
end
