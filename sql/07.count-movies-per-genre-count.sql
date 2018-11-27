select
  genre_count, count(1)
from (
  select occurrences_regexpr('[|]' in genres) + 1 genre_count
  from "aa.movielens.db.hdb::data.movies"
) group by genre_count order by genre_count;
