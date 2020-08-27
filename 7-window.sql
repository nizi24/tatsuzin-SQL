SELECT prc_date, prc_amt,
       CASE WHEN COUNT(*) OVER (ORDER BY prc_date) >= 2
       THEN AVG(prc_amt) OVER (ORDER BY prc_date 2 PRECEDING)
       ELSE NULL END AS 移動平均
FROM Accounts;
