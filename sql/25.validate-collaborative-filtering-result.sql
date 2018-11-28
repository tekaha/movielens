select reco_count, count(1) as user_count
from (
  select userid, max(rank) as reco_count
  from "aa.movielens.db.hdb.pal.views::apriori_collaborative"
  group by userid
) group by reco_count order by reco_count desc;


select
    count(1) as movie_count
  , count(1) *100 / (select count(1) as count from "aa.movielens.db.hdb::data.movies" ) as movie_ratio
from (
  select movieid
  from "aa.movielens.db.hdb.pal.views::apriori_collaborative"
  group by movieid
);


select
    count(1) as movie_count
  , count(1) *100 / (select count(1) as count from "aa.movielens.db.hdb::data.movies" ) as movie_ratio
from (
  select prerule as movieid
  from "aa.movielens.db.hdb.pal::apriori.rules"
  where prerule not like '%&%'
  group by prerule
);
