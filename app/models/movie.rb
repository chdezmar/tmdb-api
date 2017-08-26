class Movie < ApplicationRecord
  validates_presence_of :title, :release_date
  belongs_to :user, optional: true
  has_many :cast
  has_many :director
  has_many :people, -> { distinct }, through: [:cast, :director]
  has_many :ratings
end
