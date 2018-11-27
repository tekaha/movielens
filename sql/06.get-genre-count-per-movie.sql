select
    movieid
  , title
  , occurrences_regexpr('[|]' in genres) + 1 as genre_count
  , genres
from "aa.movielens.db.hdb::data.movies"
order by genre_count asc;
