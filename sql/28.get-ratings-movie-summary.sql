select
  'summary::ratings_movie' as "view name",
  count(1) as "row count"
from "aa.movielens.db.hdb.summary::ratings_movie"
