class Fund < ApplicationRecord
  has_many :assets
  has_many :users, through: :assets

  validates :symbol, presence: true
  validates :symbol, uniqueness: true

  accepts_nested_attributes_for :assets,
    :reject_if => :all_blank
end
