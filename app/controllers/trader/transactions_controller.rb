class Trader::TransactionsController < ApplicationController
  before_action :authenticate_trader!

  def index
    @transactions = current_trader.transactions
  end

  def create
    transaction = current_trader.transactions.create(transaction_params)
    portfolio = current_trader.portfolios.find_or_create_by(stock: transaction.stock)
    
    if transaction.buy?
      portfolio.update(shares: portfolio.shares.to_i + transaction.shares)

      redirect_to trader_path
    elsif transaction.sell?
      portfolio.update(shares: portfolio.shares.to_i - transaction.shares)

      redirect_to trader_portfolio_path
    end
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
