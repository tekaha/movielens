select count(1)
from (
  select movieid, count(1) as tag_count
  from "aa.movielens.db.hdb::data.tags"
  group by movieid
);
