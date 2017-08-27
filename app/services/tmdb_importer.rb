module TmdbImporter

  class << self
    attr_accessor :movies, :movies_hash
  end

  self.movies = []
  self.movies_hash = []

  def self.start
    self.get_upcoming_movies
    self.build_movies_hash
    self.add_movies
  end

  def self.get_upcoming_movies
    (1..5).each do |n|
      self.movies << Tmdb::Movie.upcoming(page:n).results
    end
    self.movies.flatten!
  end

  def self.build_movies_hash
    self.movies.each do |m|
      self.movies_hash << {
                           title:m.title,
                           release_date:m.release_date,
                           description:m.overview,
                           original_rating:m.vote_average,
                           original_id: m.id
                          }
    end
  end

  def self.add_movies
    self.movies_hash.each do |m|
      begin
        movie = Movie.new(m)
        movie.save!
      rescue
        movie = Movie.find_by_title(m[:title])
        puts 'Movie already added'
      end
      sleep(rand(1..1.2))
      Tmdb::Movie.director(m[:original_id]).each do |d|
        begin
          director = Person.new(name: d.name)
          director.save!
        rescue
          director = Person.find_by_name(d.name)
          puts 'Person already added'
        end
        sleep(0.1)
        movie.director.new(person_id: director.id).save! rescue 'Director relationship error'
      end
      # Added sleep to avoid API abuse.
      # Also, only getting 4 actors.
      sleep(rand(1..1.2))
      Tmdb::Movie.cast(m[:original_id]).first(4).each do |d|
        begin
          actor = Person.new(name: d.name)
          actor.save!
        rescue
          actor = Person.find_by_name(d.name)
          puts 'Person already added'
        end
        sleep(0.1)
        movie.cast.new(person_id: actor.id).save! rescue 'Actor relationship error'
      end
    end
  end

end
