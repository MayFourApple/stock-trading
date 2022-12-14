require 'rails_helper'

RSpec.feature 'Trader Account', type: :feature do
  scenario 'trader can create an account' do
    visit '/traders/sign_up'
    fill_in 'trader[email]', with: 'example@email.com'
    fill_in 'trader[password]', with: 'password'
    fill_in 'trader[password_confirmation]', with: 'password'
    click_on 'Sign up'

    trader = Trader.first
    expect(trader).to have_attributes(email: 'example@email.com')
  end

  scenario 'trader can login to their account' do
    trader = Trader.create(email: 'example@email.com', password: 'password')
    trader.confirm
    trader.approve

    visit '/traders/sign_in'
    fill_in 'trader[email]', with: 'example@email.com'
    fill_in 'trader[password]', with: 'password'
    click_on 'Log in'

    trader = Trader.first
    expect(trader).to have_attributes(email: 'example@email.com')
  end
end
