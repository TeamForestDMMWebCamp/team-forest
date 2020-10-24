class ChangeOrderdProductsToOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :orderd_products, :ordered_products
  end
end
