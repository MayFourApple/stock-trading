class TraderController < ApplicationController
  before_action :authenticate_trader!

  def index
    @quotes = IEXClient.stock_market_list(:mostactive)
  end
end
