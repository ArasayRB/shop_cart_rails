class CreateClasifications < ActiveRecord::Migration[6.1]
  def change
    create_table :clasifications do |t|
      t.integer :clasification

      t.timestamps
    end
  end
end
