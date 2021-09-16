class Product < ApplicationRecord
  validates :code, presence: true, length: {minimum: 6}
  validates :name, presence: true
  validates :stock, presence: true
  validates :price, presence: true
  validates :um, presence: true
end
