class Transaction < ApplicationRecord
  belongs_to :trader

  def buy?
    String(category) == 'buy'
  end
end
