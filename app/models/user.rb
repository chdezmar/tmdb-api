class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

  has_many :movies
  has_many :ratings, dependent: :destroy
end