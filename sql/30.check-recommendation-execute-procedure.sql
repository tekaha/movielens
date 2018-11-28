DO BEGIN
  call "aa.movielens.db.hdb.apl.procedures::recommendation_execute"(
    BESTSELLERTHRESHOLD    => 50000,
    MAXTOPNODES            => 100000,
    MINIMUMCONFIDENCE      => 0.05,
    MINIMUMPREDICTIVEPOWER => null,
    MINIMUMSUPPORT         => 2,
    OPERATION_LOG   => :OPERATION_LOG,
    SUMMARY         => :SUMMARY,
    INDICATORS      => :INDICATORS,
    MODEL_SQL_CODE  => :MODEL_SQL_CODE
  );

  select 'distinct users included in the model'  as key, count(1) as value from "aa.movielens.db.hdb.apl::recommendation.model_node_user"
  union all
  select 'distinct movies included in the model' as key, count(1) as value from "aa.movielens.db.hdb.apl::recommendation.model_node_movie";
END;
