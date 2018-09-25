class Fund < ApplicationRecord
  belongs_to :portfolio, inverse_of :funds
  belongs_to :user

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
end
