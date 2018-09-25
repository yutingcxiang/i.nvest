class User < ApplicationRecord
  has_many :portfolios, through: :funds
  has_many :funds

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
