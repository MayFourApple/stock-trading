class Trader::TransactionsController < ApplicationController
  before_action :authenticate_trader!

  def create
    transaction = current_trader.transactions.create(transaction_params)
    portfolio = current_trader.portfolios.find_or_create_by(stock: transaction.stock)
    
    if transaction.buy?
      portfolio.update(shares: portfolio.shares.to_i + transaction.shares)
    end

    redirect_to trader_path
  end

  private

  def transaction_params
    quote = IEXClient.quote(params[:transaction][:stock])
    {
      price: quote.iex_realtime_price,
      **(params.require(:transaction).permit(:category, :stock, :shares))
    }
  end
end
