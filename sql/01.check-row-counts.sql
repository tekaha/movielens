select 'links'   as "table name", count(1) as "row count" from "aa.movielens.db.hdb::data.links"
union all
select 'movies'  as "table name", count(1) as "row count" from "aa.movielens.db.hdb::data.movies"
union all
select 'ratings' as "table name", count(1) as "row count" from "aa.movielens.db.hdb::data.ratings"
union all
select 'tags'    as "table name", count(1) as "row count" from "aa.movielens.db.hdb::data.tags";
