class Product < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :stock, presence: true
  validates :price, presence: true
  validates :um, presence: true
end
