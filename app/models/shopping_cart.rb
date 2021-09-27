class ShoppingCart < ApplicationRecord
  has_many :item_lines, dependent: :destroy

  def add_product(product_id)
    current_item = item_lines.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = item_lines.build(product_id: product_id)
    end
    current_item
  end

  def re_stock_catalog_products(shopping_cart)
    items = ItemLine.where(shopping_cart:shopping_cart)
    items.each do |item|
      product = Product.find(item.product_id)
      stock = product.stock + item.quantity
      product.update(stock:stock)
    end
  end

  def total_price
    item_lines.to_a.sum{|item| item.total_price }
  end

end
