class AddQuantityToItemLines < ActiveRecord::Migration[6.1]
  def change
    add_column :item_lines, :quantity, :integer, default:1
  end
end
