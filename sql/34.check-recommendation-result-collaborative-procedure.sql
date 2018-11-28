DO BEGIN
  call "aa.movielens.db.hdb.pal.procedures::apriori_result_collaborative"(
    USERID    => 23,
    KEEPTOPN  => 5,
    RESULTS   => :results
  );
  select * from :results;
END;
