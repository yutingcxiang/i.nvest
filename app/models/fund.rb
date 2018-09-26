class Fund < ApplicationRecord
  has_many :assets
  has_many :users, through: :assets

  validates :name, presence: true
  validates :industry, presence: true
  validates :strategy, presence: true


end
