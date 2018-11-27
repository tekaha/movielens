do begin
  declare genrearray nvarchar(255) array;
  declare tmp nvarchar(255);
  declare idx integer;
  declare sep nvarchar(1) := '|';
  declare cursor cur for select distinct genres from "aa.movielens.db.hdb::data.movies";
  declare genres nvarchar (255) := '';
  idx := 1;
  for cur_row as cur() do
    select cur_row.genres into genres from dummy;
    tmp := :genres;
    while locate(:tmp,:sep) > 0 do
      genrearray[:idx] := substr_before(:tmp,:sep);
      tmp := substr_after(:tmp,:sep);
      idx := :idx + 1;
    end while;
    genrearray[:idx] := :tmp;
  end for;
  genrelist = unnest(:genrearray) as (genre);
  select genre from :genrelist group by genre;
end;
