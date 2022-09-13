class TraderMailer < ApplicationMailer
  default from: "Stocktrader <mayfourapple@gmail.com>"

  def approval
    @trader = params[:trader]
    mail(to: @trader.email, subject: 'Your Stocktrader account has been approved')
  end
end
