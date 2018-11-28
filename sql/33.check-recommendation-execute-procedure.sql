DO BEGIN
  call "aa.movielens.db.hdb.pal.procedures::apriori_execute"(
    MIN_SUPPORT    => 0.1,
    MIN_CONFIDENCE => 0.1,
    MIN_LIFT       => 0.0,
    UBIQUITOUS     => 1.0,
    RULES   => :rules,
    PMML    => ?
  );

  select 'rules count' as key, count(1) as value from :rules;
END;
