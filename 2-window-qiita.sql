CREATE TABLE 家計簿 (id INT, 品目 VARCHAR(10), 出費額 INT, 日付 DATE);

INSERT INTO 家計簿 VALUES (1, '食費', 1000, '2020-08-01');
INSERT INTO 家計簿 VALUES (2, '雑費', 3000, '2020-08-10');
INSERT INTO 家計簿 VALUES (3, '食費', 2000, '2020-08-02');
INSERT INTO 家計簿 VALUES (4, '食費', 500, '2020-08-03');
INSERT INTO 家計簿 VALUES (5, '食費', 800, '2020-08-05');
INSERT INTO 家計簿 VALUES (6, '食費', 1500, '2020-08-01');
INSERT INTO 家計簿 VALUES (7, '雑費', 100, '2020-08-06');
INSERT INTO 家計簿 VALUES (8, '雑費', 600, '2020-08-05');

SELECT SUM(出費額) AS 支出 FROM 家計簿;

SELECT 家計簿.*, SUM(出費額) OVER() AS 支出 FROM 家計簿;

SELECT 品目, SUM(出費額) AS 支出 FROM 家計簿 GROUP BY 品目;

SELECT id, 品目, 日付, SUM(出費額) OVER (PARTITION BY 品目) AS 支出 FROM 家計簿 ORDER BY id;

SELECT id, 品目, 日付, 出費額, SUM(出費額) OVER (ORDER BY 日付) AS その日までの合計支出 FROM 家計簿;

UPDATE 家計簿 SET 日付 = '2020-08-08' WHERE id = 1;
UPDATE 家計簿 SET 日付 = '2020-08-11' WHERE id = 8;

SELECT id, 品目, 日付, 出費額,
       SUM(出費額) OVER (ORDER BY 日付 ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
       AS 前の一日との合計
FROM 家計簿;

SELECT id, 品目, 日付, 出費額,
       MIN(出費額) OVER (ORDER BY 日付 RANGE BETWEEN interval '1' day PRECEDING
                                               AND interval '1' day PRECEDING)
       AS 1日前の出費額
FROM 家計簿;

SELECT id, 品目, 日付, 出費額,
       MIN(日付) OVER (ORDER BY 出費額 RANGE BETWEEN 300 PRECEDING
                                                AND 1 PRECEDING)
       AS 1日前の出費額
FROM 家計簿;

SELECT id, 日付, 出費額,
       SUM(出費額) OVER W AS 前の行との合計,
       AVG(出費額) OVER W AS 前の行との平均,
       MAX(出費額) OVER W AS 前の行との最大値
FROM 家計簿
WINDOW W AS (ORDER BY 日付 ROWS 1 PRECEDING);
