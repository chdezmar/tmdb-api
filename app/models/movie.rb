class Movie < ApplicationRecord
  validates_presence_of :title, :release_date
  belongs_to :user, optional: true
  has_many :cast
  has_many :director
  has_many :people, -> { distinct }, through: [:cast, :director]
  has_many :ratings


  def users_average_rating
    self.ratings.where(movie_id: self.id).average(:rating)
  end

  def total_average_rating
    (users_average_rating + self.original_rating) / 2
  end



end
