select count(1)
from "aa.movielens.db.hdb::data.links" l
where not exists (select 1 from "aa.movielens.db.hdb::data.movies" m where l.movieid = m.movieid)
union all
select count(1)
from "aa.movielens.db.hdb::data.movies" m
where not exists (select 1 from "aa.movielens.db.hdb::data.links" l where l.movieid = m.movieid);
