json.extract! product, :id, :code, :name, :stock, :price, :um, :img, :created_at, :updated_at
json.url product_url(product, format: :json)
