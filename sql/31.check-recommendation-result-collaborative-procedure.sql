DO BEGIN
  call "aa.movielens.db.hdb.apl.procedures::recommendation_result_collaborative"(
    USERID              => 32,
    INCLUDEBESTSELLER   => 0,
    BESTSELLERTHRESHOLD => 50000,
    SKIPALREADYOWNED    => 1,
    KEEPTOPN            => 5,
    RESULTS             => :results
  );
  select * from :results;
END;
