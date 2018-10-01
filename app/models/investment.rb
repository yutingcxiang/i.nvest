class Investment < ApplicationRecord
  belongs_to :fund
  belongs_to :user

  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :fund, :associated => true, :presence => true

  def new_fund=(new_fund)
    if !new_fund[:symbol].empty?
      fund = Fund.find_or_create_by(new_fund)
      self.fund = fund
    end
  end
end
