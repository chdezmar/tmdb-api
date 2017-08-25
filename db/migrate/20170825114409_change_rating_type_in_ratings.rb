class ChangeRatingTypeInRatings < ActiveRecord::Migration[5.1]
  def change
    change_column :ratings, :rating, :float
  end
end
