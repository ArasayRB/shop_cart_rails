json.extract! credit_card, :id, :number, :cvv, :cash, :expire, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
