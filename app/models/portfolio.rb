class Portfolio < ApplicationRecord
  has_many :funds
  belongs_to :user

  validates :name, presence: true
  validates :strategy, presence: true

  accepts_nested_attributes_for :funds,
    :reject_if => :all_blank,
    :allow_destroy => true

end
