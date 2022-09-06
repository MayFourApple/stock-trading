class Admin::TradersController < ApplicationController
  def pending
    @traders = Trader.pending
  end

  def approve
    @trader = Trader.find(params[:id])
    @trader.approve

    redirect_to pending_admin_traders_path
  end
end