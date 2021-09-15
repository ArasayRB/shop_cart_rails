class ShoppingCart < ApplicationRecord
  validates :quantity, presence: true
end
