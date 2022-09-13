class Trader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :transactions
  has_many :portfolios

  scope :pending, -> { where(approved_at: nil) }

  def approve
    update(approved_at: Time.now)
    TraderMailer.with(trader: self).approval.deliver_now
  end

  def approved?
    approved_at.present?
  end
end
