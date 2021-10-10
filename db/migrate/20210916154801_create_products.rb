class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.float :stock
      t.float :price, precision: 8, scale: 2
      t.string :um
      t.string :img

      t.timestamps
    end
  end
end
