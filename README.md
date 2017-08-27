#TMDB Upcoming movies

##Details
- Rails 5.1 app
- PSQL
- User authentication (has_secure_password with bcrytp)
- List of upcoming movies from [Tmdb API](https://www.themoviedb.org/)
- Users can add, edit and remove movies and ratings
- Search by movie title, sort by title, release_date and rating
- List of upcoming movies updated everyday (cron job using wheneverize gem)
- Bootstrap styling

##Gems
- 'themoviedb-api'
- 'rails-assets-jquery'
- 'rails-assets-bootstrap'
- 'will_paginate'
- 'whenever'