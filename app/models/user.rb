class User < ApplicationRecord
  has_many :assets
  has_many :funds, through: :assets

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
