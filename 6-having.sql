INSERT INTO TestResults VALUES (001, 'A', '男', 100);
INSERT INTO TestResults VALUES (002, 'A', '女', 100);
INSERT INTO TestResults VALUES (003, 'A', '女', 49);
INSERT INTO TestResults VALUES (004, 'A', '男', 30);
INSERT INTO TestResults VALUES (005, 'B', '女', 100);
INSERT INTO TestResults VALUES (006, 'B', '男', 92);
INSERT INTO TestResults VALUES (007, 'B', '男', 80);
INSERT INTO TestResults VALUES (008, 'B', '男', 80);
INSERT INTO TestResults VALUES (009, 'B', '女', 10);
INSERT INTO TestResults VALUES (010, 'C', '男', 92);
INSERT INTO TestResults VALUES (011, 'C', '男', 80);
INSERT INTO TestResults VALUES (012, 'C', '女', 21);
INSERT INTO TestResults VALUES (013, 'D', '女', 100);
INSERT INTO TestResults VALUES (014, 'D', '女', 0);
INSERT INTO TestResults VALUES (015, 'D', '女', 0);


SELECT class FROM TestResults
GROUP BY class
HAVING COUNT(*) * 0.75 <= SUM(CASE WHEN score >= 80 THEN 1
                              ELSE 0 END);

SELECT class FROM TestResults
GROUP BY class
HAVING SUM(CASE WHEN score >= 50 AND sex = '男' THEN 1 ELSE 0 END) >
      SUM(CASE WHEN sex = '女' AND score >= 50 THEN 1 ELSE 0 END);

SELECT class FROM TestResults
GROUP BY class
HAVING AVG(CASE WHEN sex = '女' THEN score ELSE NULL END) >
       AVG(CASE WHEN sex = '男' THEN score ELSE NULL END);


6-1,
SELECT CASE WHEN COUNT(*) <> MAX(seq) THEN '歯抜けあり'
       ELSE '歯抜けなし' END
FROM SeqTbl;

6-2,
SELECT dpt FROM Students
GROUP BY dpt
HAVING COUNT(*) = SUM(CASE WHEN sbmt_date < '2018-10-01' THEN 1
                      ELSE 0 END);

6-3,
SELECT shop, COUNT(I1.item), COUNT(item)
FROM ShopItems S1 INNER JOIN Items I1
ON S1.item = I1.item
