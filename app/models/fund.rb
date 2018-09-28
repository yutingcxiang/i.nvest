class Fund < ApplicationRecord
  has_many :investments
  has_many :users, through: :investments

  validates :name, presence: true, uniqueness: true
  validates :industry, presence: true
  validates :strategy, presence: true

  accepts_nested_attributes_for :investments

  def new_investment=(new_investment)
   if !new_investment[:symbol].empty? || !new_investment[:symbol].nil?
     investment = Investment.find_or_create_by(new_investment)
     self.investments << investment
   end
 end

end
