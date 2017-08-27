class Movie < ApplicationRecord
  include TmdbImporter
  validates_presence_of :title, :release_date
  validates_uniqueness_of :title
  belongs_to :user, optional: true
  has_many :cast, dependent: :destroy
  has_many :director, dependent: :destroy
  has_many :people, -> { distinct }, through: [:director, :cast]
  has_many :ratings, dependent: :destroy


  def users_average_rating
    self.ratings.where(movie_id: self.id).average(:rating)
  end

  def total_average_rating
    begin
      (users_average_rating + self.original_rating) / 2
    rescue
      self.original_rating || 0
    end
  end

  def self.search(search)
    case search[:by]
    when '0'
      @search = where("title ILIKE ?", "%#{search[:q]}%")
    when '1'
      @search = all
      # Something wrong with => has_many :people, -> { distinct }, through: [:director, :cast]
      #joins(:director).joins(:people).where("name ILIKE ?", "%#{search[:q]}%").distinct
    when '2'
      @search = all
      #joins(:cast).joins(:people).where("name ILIKE ?", "%#{search[:q]}%").distinct
    else
      @search = all
    end
    #@search = where("original_rating <= ?", search[:maxrating]) if search[:maxrating]
    #@search = where("original_rating >= ?", search[:minrating]) if search[:minrating]
  end
end
