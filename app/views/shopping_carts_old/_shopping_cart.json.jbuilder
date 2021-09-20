json.extract! shopping_cart, :id, :quantity, :created_at, :updated_at
json.url shopping_cart_url(shopping_cart, format: :json)
