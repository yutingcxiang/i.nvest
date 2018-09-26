class User < ApplicationRecord
  has_many :assets
  has_many :funds, through: :assets

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
