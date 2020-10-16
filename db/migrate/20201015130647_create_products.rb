class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :discription
      t.integer :price_excluding_tax
      t.boolean :is_active,  null: false, default: true
      t.timestamps
    end
  end
end
