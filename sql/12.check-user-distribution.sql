select rating_count, count(1) as user_count
from (
  select userid, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings"
  group by userid
)
group by rating_count order by 1 desc;
