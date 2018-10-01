class Fund < ApplicationRecord
  has_many :investments
  has_many :users, through: :investments

  validates :symbol, presence: true, uniqueness: true
  validates_format_of :symbol, :with => /[A-Za-z]*/
end
