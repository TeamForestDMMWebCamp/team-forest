class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_address
      t.integer :shipping_fee
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_received_status

      t.timestamps
    end
  end
end
