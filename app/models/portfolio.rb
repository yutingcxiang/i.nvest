class Portfolio < ApplicationRecord
  belongs_to :fund, inverse_of: :funds
  belongs_to :user

  validates :name, presence: true
  validates :strategy, presence: true
end
