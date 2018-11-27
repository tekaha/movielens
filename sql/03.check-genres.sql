select count(1)
from "aa.movielens.db.hdb::data.movies"
where genres is null or length(genres)=0;
