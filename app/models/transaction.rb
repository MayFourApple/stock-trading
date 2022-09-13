class Transaction < ApplicationRecord
  def buy?
    String(category) == 'buy'
  end
end
