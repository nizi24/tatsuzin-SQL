2-1,
SELECT server, sample_date,
SUM(load_val) OVER () AS sum_load
FROM ServerLoadSumple;
