json.extract! item_line, :id, :product_id, :shopping_cart_id, :created_at, :updated_at
json.url item_line_url(item_line, format: :json)
