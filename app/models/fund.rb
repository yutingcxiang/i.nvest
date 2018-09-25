class Fund < ApplicationRecord
  has_many :portfolios
  has_many :users, through: :portfolios

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :quantity, numericality: {greater_than: 0}
  validates :cost, numericality: {greater_than: 0}
end
