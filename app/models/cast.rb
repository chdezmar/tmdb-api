class Cast < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  validates_uniqueness_of :person_id, scope: :movie_id
end
