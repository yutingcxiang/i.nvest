class Portfolio < ApplicationRecord
  has_many :funds
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :strategy, presence: true
end