select rating, count(1) as rating_count
from "aa.movielens.db.hdb::data.ratings"
group by rating order by 1 desc;
