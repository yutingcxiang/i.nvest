class Asset < ApplicationRecord
  belongs_to :fund
  belongs_to :user

  validates :name, presence: true
  validates :strategy, presence: true
end
