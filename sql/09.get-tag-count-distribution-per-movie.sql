select tag_count, count(1)
from (
  select movieid, count(1) as tag_count
  from "aa.movielens.db.hdb::data.tags"
  group by movieid
)
group by tag_count order by tag_count;
