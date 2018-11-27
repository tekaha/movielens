select rating,  count(1) as users_count from (
  select userid, rating, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings"
  group by userid, rating
)
group by rating order by 1 desc;
