select reco_count, count(1) as user_count
from (
  select userid, max(rank) as reco_count
  from "aa.movielens.db.hdb.apl.views::recommendation_collaborative"
  group by userid
) group by reco_count order by 1 desc;

select
    count(1) as movie_count
  , count(1) * 100 / (select count(1) as cnt from "aa.movielens.db.hdb::data.movies") as movie_ratio
from (
  select movieid
  from "aa.movielens.db.hdb.apl.views::recommendation_collaborative"
  group by movieid
);

select
    count(1) as movie_count
  , count(1) * 100 / (select count(1) as cnt from "aa.movielens.db.hdb::data.movies") as movie_ratio
from (
    select movieid
    from (
      select kxnodesecond   as movieid from "aa.movielens.db.hdb.apl::recommendation.model_links" where graph_name = 'Item' group by  kxnodesecond
      union all
      select kxnodesecond_2 as movieid from "aa.movielens.db.hdb.apl::recommendation.model_links" where graph_name = 'Item' group by  kxnodesecond_2
    ) group by movieid
);
