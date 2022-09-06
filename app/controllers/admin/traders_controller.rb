class Admin::TradersController < ApplicationController
  def pending
    @traders = Trader.pending
  end
end
