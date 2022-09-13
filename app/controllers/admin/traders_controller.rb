class Admin::TradersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @traders = Trader.all
  end

  def show
    @trader = Trader.find(params[:id])
  end

  def pending
    @traders = Trader.pending
  end

  def approve
    @trader = Trader.find(params[:id])
    @trader.approve

    redirect_to pending_admin_traders_path
  end
end
