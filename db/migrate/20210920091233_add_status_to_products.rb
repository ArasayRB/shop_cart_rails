class AddStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :status, :boolean, default: 1
  end
end
