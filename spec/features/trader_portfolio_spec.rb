require 'rails_helper'

RSpec.feature 'Portfolio', type: :feature do
  scenario 'trader can sell a stock from their portfolio' do
    # Given
    trader = Trader.create(email: 'mayfourapple@gmail.com', password: 'password')
    trader.confirm
    trader.approve

    portfolio = Portfolio.create(trader: trader, stock: 'AAPL', shares: 1000)

    # When
    sign_in trader
    visit '/trader/portfolio'
    click_on 'Sell'
    fill_in 'transaction[shares]', with: 100
    click_on 'Create Transaction'

    # Then
    transaction = Transaction.first
    expect(transaction).to have_attributes(category: 'sell', trader: trader, stock: 'AAPL', shares: 100)

    portfolio.reload
    expect(portfolio).to have_attributes(shares: 900)
  end
end
