class CreateShoppingCartPayeds < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_payeds do |t|
      t.integer :shopping_cart_id
      t.integer :user_id
      t.string :payment_choice
      t.float :cash

      t.timestamps
    end
  end
end
