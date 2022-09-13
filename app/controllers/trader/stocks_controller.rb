class Trader::StocksController < ApplicationController
  before_action :authenticate_trader!

  def buy
    @quote = IEXClient.quote(params[:id])
    @transaction = current_trader.transactions.new(category: :buy, stock: @quote.symbol)
  end

  def sell
    @portfolio = Portfolio.find(params[:id])
    @transaction = current_trader.transactions.new(category: :sell, stock: @portfolio.stock)
  end
end
