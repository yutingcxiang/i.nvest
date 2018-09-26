class Fund < ApplicationRecord
  has_many :investments
  has_many :users, through: :investments

  validates :name, presence: true
  validates :industry, presence: true
  validates :strategy, presence: true


end
