-- Clear tables content
truncate table "aa.movielens.db.hdb.pal::apriori.parameter";
truncate table "aa.movielens.db.hdb.pal::apriori.rules";
truncate table "aa.movielens.db.hdb.pal::apriori.pmml";

-- Insert operation parameters
insert into "aa.movielens.db.hdb.pal::apriori.parameter" VALUES ('MIN_SUPPORT'     , null, 0.1, null);
insert into "aa.movielens.db.hdb.pal::apriori.parameter" VALUES ('MIN_CONFIDENCE'  , null, 0.1, null);
insert into "aa.movielens.db.hdb.pal::apriori.parameter" VALUES ('MAX_CONSEQUENT'  , 1  , null, null);
insert into "aa.movielens.db.hdb.pal::apriori.parameter" VALUES ('MAX_ITEM_LENGTH' , 1  , null, null);

call "aa.movielens.db.hdb.pal.afllang::apriori"(
  "aa.movielens.db.hdb.pal::apriori.movielens_dataset",
  "aa.movielens.db.hdb.pal::apriori.parameter",
  "aa.movielens.db.hdb.pal::apriori.rules",
  "aa.movielens.db.hdb.pal::apriori.pmml"
) with overview;
