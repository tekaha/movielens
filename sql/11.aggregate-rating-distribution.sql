select distinct
  min(rating_count) over( ) as min,
  max(rating_count) over( ) as max,
  avg(rating_count) over( ) as avg,
  sum(rating_count) over( ) as sum,
  median(rating_count) over( ) as median,
  stddev(rating_count) over( ) as stddev,
  count(*) over( ) as category_count
from (
  select movieid, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings"
  group by movieid
)
group by rating_count;
