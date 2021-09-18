class CreditCard < ApplicationRecord
  validates :number, presence: true, length: {minimum: 12}
  validates :cvv, presence: true
  validates :cash, presence: true
  validates :expire, presence: true
  belongs_to :user
end
