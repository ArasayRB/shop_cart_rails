class CreateItemLines < ActiveRecord::Migration[6.1]
  def change
    create_table :item_lines do |t|
      t.integer :product_id
      t.integer :shopping_cart_id

      t.timestamps
    end
  end
end
