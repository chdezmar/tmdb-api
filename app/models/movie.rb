class Movie < ApplicationRecord
  validates_presence_of :title, :release_date
  belongs_to :user
end
