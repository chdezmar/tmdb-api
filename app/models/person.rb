class Person < ApplicationRecord
  has_many :cast
  has_many :movies, through: :cast
end
