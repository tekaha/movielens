select rating,  count(1) as movie_count from (
  select movieid, rating, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings"
  group by movieid, rating
)
group by rating order by 1 desc;
