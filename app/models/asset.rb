class Asset < ApplicationRecord
  belongs_to :fund, inverse_of: :portfolios
  belongs_to :user

  validates :name, presence: true
  validates :strategy, presence: true
end
