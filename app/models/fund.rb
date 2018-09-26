class Fund < ApplicationRecord
  has_many :investments, inverse_of: :fund
  has_many :users, through: :investments

  validates :name, presence: true
  validates :industry, presence: true
  validates :strategy, presence: true

  accepts_nested_attributes_for :investments

  def investments_attributes=(investments_attributes)
   investments_attributes.values.each do |investment_attribute|
     investment = Investment.find_or_create_by(investment_attribute)
     self.investments << investment
   end
 end
end
