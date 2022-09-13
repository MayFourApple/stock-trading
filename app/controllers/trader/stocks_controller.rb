class Trader::StocksController < ApplicationController
  before_action :authenticate_trader!

  def buy
    @quote = IEXClient.quote(params[:id])
    @transaction = current_trader.transactions.new(category: :buy, stock: @quote.symbol)
  end
end
