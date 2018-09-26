class Asset < ApplicationRecord
  belongs_to :fund
  belongs_to :user

  validates :symbol, presence: true
end
