class RemoveImgFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :img, :string
  end
end
