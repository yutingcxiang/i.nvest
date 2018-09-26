class Fund < ApplicationRecord
  has_many :users, through: :assets
  has_many :assets, inverse_of: :asset

  validates :symbol, presence: true
  validates :symbol, uniqueness: true

  accepts_nested_attributes_for :assets,
    :reject_if => :all_blank,
    :allow_destroy => true
end
