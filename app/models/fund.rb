class Fund < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :quantity, numericality: {greater_than: 0}
  validates :cost, numericality: {greater_than: 0}
end
