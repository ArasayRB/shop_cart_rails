class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :cvv
      t.float :cash
      t.date :expire

      t.timestamps
    end
  end
end
