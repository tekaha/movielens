select rating_count, count(1) as movie_count
from (
  select movieid, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings"
  group by movieid
)
group by rating_count order by rating_count asc;
