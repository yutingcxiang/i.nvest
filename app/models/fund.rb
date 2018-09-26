class Fund < ApplicationRecord
  has_many :users, through: :portfolios
  has_many :assets, inverse_of: :asset
  
  validates :symbol, presence: true
  validates :symbol, uniqueness: true
end
