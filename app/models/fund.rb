class Fund < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :quantity, numericality: {greater_than: 0}
  validates :cost, numericality: {greater_than: 0}
end
