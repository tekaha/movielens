select reco_count, count(1) as movie_count
from (
  select movieid, max(rank) as reco_count
  from "aa.movielens.db.hdb.pal.views::apriori_contentbased"
  group by movieid
) group by reco_count order by 1 desc;


select
    count(1) as movie_count
  , count(1) *100 / (select count(1) as count from "aa.movielens.db.hdb::data.movies" ) as movie_ratio
from (
  select movieid
  from "aa.movielens.db.hdb.pal.views::apriori_contentbased"
  group by movieid
);


select rating_count, count(1) as movie_count
from (
  select ratings.movieid, count(1) as rating_count
  from "aa.movielens.db.hdb::data.ratings" ratings
  left outer join (
    select movieid
    from (
      select prerule as movieid
      from "aa.movielens.db.hdb.pal::apriori.rules"
      where prerule not like '%&%'
      group by prerule
    )
  ) t1 on (ratings.movieid = t1.movieid)
  where t1.movieid is null
  group by ratings.movieid
) group by rating_count;
