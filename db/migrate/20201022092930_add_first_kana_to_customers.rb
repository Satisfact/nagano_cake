class AddFirstKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_kana, :string
  end
end
