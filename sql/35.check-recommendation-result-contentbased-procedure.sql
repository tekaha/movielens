DO BEGIN
  call "aa.movielens.db.hdb.pal.procedures::apriori_result_contentbased"(
    MOVIEID   => 32,
    KEEPTOPN  => 5,
    RESULTS   => :results
  );
  select * from :results;
END;
