UPDATE key
SET s_key = CASE s_key WHEN 'a' THEN 'b'
                       WHEN 'b' THEN 'a'
            ELSE s_key END;

1-1,
SELECT key,
      CASE WHEN x > y THEN x
      ELSE y END AS greatest
FROM Greatests;

SELECT key,
      CASE WHEN z > (CASE WHEN x > y THEN x
      ELSE y END) THEN z
      CASE WHEN x > y THEN x
      ELSE y END AS greatest
FROM Greatests;

1-2,
SELECT CASE WHEN sex = 1 THEN '男'
       ELSE '女' END AS '性別',
       SUM(population) AS '全国',
       SUM(CASE WHEN pref_name = '徳島' THEN population
       ELSE 0 END) AS '徳島',
       SUM(CASE WHEN pref_name = '香川' THEN population
       ELSE 0 END) AS '香川',
       SUM(CASE WHEN pref_name = '愛媛' THEN population
       ELSE 0 END) AS '愛媛',
       SUM(CASE WHEN pref_name = '高知' THEN population
       ELSE 0 END) AS '高知',
       SUM(SELECT CASE WHEN pref_name IN ('徳島', '香川', '愛媛', '高知')
       THEN population ELSE 0 END) AS '四国'
FROM PopTbl2
GROUP BY sex;

1-3,
SELECT * FROM Greatests
ORDER BY CASE key
WHEN 'b' THEN 1
WHEN 'a' THEN 2
WHEN 'c' THEN 3
WHEN 'd' THEN 4
ELSE NULL END;
