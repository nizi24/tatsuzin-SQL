SELECT DISTINCT P1.* FROM Products P1
INNER JOIN Products P2
ON P1.price = P2.price
AND P1.name <> P2.name

3-1,
SELECT * FROM Products P1
INNER JOIN Products P2
ON P1 <> P2
OR P1 = P2
