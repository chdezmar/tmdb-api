module MoviesHelper
  def current_user_rating
    @movie.ratings.where(user_id: current_user.id)
  end
end
