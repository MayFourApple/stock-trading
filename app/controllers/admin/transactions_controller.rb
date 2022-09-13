class Admin::TransactionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @transactions = Transaction.all
  end
end
