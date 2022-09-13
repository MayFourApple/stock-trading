class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.belongs_to :trader
      t.string :stock
      t.integer :shares
      t.timestamps
    end
  end
end
