class Portfolio < ApplicationRecord
  def current_price
    quote.iex_realtime_price
  end

  def current_value
    current_price * shares
  end

  def quote
    @quote ||= IEXClient.quote(stock)
  end
end
