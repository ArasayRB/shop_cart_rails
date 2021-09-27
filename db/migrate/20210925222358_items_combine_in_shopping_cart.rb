class ItemsCombineInShoppingCart < ActiveRecord::Migration[6.1]
  def change
  end
  
  def self.up
    # replace multiple items for a single product in a cart with a single item
    ShoppingCart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.item_lines.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.item_lines.where(product_id: product_id).delete_all

          # replace with a single item
          cart.item_lines.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end

  def self.down
    # split items with quantity>1 into multiple items
    ItemLine.where("quantity>1").each do |item_line|
      # add individual items
      item_line.quantity.times do
        ItemLine.create cart_id:item_line.cart_id, product_id: item_line.product_id, quantity: 1
      end

      # remove original item
      item_line.destroy
    end
  end
end
