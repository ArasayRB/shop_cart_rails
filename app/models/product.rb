class Product < ApplicationRecord
  has_rich_text :description
  validates :code, presence: true, :uniqueness => true, length: {minimum: 6, maximum: 6}
  validates :name, presence: true, :uniqueness => true
  validates :stock,:price, presence: true, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :um, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :item_lines
  before_destroy :ensure_not_referenced_by_any_item_line

  private

#method to verificate if are any item referencing to this product
def ensure_not_referenced_by_any_item_line
  if item_lines.empty?
    return true
  else
    errors.add(:base, 'Line Items present')
    return false
  end
end

end
