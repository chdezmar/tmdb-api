class Person < ApplicationRecord
  alias_attribute :directed_movies, :director
  alias_attribute :starring_movies, :cast
  has_many :cast
  has_many :director
  has_many :movies, -> { distinct }, through: [:cast, :director]
end
