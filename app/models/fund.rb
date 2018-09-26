class Fund < ApplicationRecord
  has_many :users, through: :portfolios
  has_many :portfolios, inverse_of: :fund

  validates :symbol, presence: true
  validates :symbol, uniqueness: true

  accepts_nested_attributes_for :portfolios,
    :reject_if => :all_blank,
    :allow_destroy => true
end
