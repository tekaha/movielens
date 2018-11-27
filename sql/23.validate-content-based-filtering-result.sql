select reco_count, count(1) as movie_count
from (
  select movieid, max(rank) as reco_count
  from "aa.movielens.db.hdb.apl.views::recommendation_contentbased"
  group by movieid
) group by reco_count;

select
    count(1) as movie_count
  , count(1) * 100 / (select count(1) as cnt from "aa.movielens.db.hdb::data.movies" ) as movie_ratio
from (
  select movieid
  from "aa.movielens.db.hdb.apl.views::recommendation_contentbased"
  group by movieid
);

select rating_count, count(1) as movie_count
from (
  select ratings.movieid, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings" ratings
  left outer join (
    select movieid
    from (
      select movieid
      from (
        select kxnodesecond   as movieid from "aa.movielens.db.hdb.apl::recommendation.model_links" where graph_name = 'Item' group by  kxnodesecond
        union all
        select kxnodesecond_2 as movieid from "aa.movielens.db.hdb.apl::recommendation.model_links" where graph_name = 'Item' group by  kxnodesecond_2
      ) group by movieid
    )
  ) t1 on (ratings.movieid = t1.movieid)
  where t1.movieid is null
  group by ratings.movieid
) group by rating_count;
