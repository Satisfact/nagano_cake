class AddLastKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_kana, :string
  end
end
