class TraderController < ApplicationController
  before_action :authenticate_trader!

  def index
    @quotes = IEXClient.stock_market_list(:mostactive)
  end

  def portfolio
    @portfolios = current_trader.portfolios
  end
end
