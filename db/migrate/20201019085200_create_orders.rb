class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null:false
      t.string :postcode, null:false
      t.string :address, null:false
      t.string :name, null:false
      t.integer :send_cost, default: 800, null:false
      t.integer :bill, null:false
      t.integer :pay, default: 0
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
