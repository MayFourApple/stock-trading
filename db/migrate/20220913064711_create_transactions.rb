class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :category
      t.belongs_to :trader
      t.string :stock
      t.integer :shares
      t.decimal :price
      t.timestamps
    end
  end
end
