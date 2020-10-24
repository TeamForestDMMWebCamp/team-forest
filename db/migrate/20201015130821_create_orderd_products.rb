class CreateOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :ordered_quantity
      t.integer :production_status, null: false, default: 0 #着手不可
      t.integer :price_including_tax
      t.timestamps
    end
  end
end
