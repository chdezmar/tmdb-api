class Movie < ApplicationRecord
  include TmdbImporter
  validates_presence_of :title, :release_date
  validates_uniqueness_of :title
  belongs_to :user, optional: true
  has_many :cast, dependent: :destroy
  has_many :director, dependent: :destroy
  has_many :people, -> { distinct }, through: [:cast, :director]
  has_many :ratings, dependent: :destroy


  def users_average_rating
    self.ratings.where(movie_id: self.id).average(:rating)
  end

  def total_average_rating
    begin
      (users_average_rating + self.original_rating) / 2
    rescue
      self.original_rating
    end
  end



end
