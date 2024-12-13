/* Case */

-- Case Syntax: `CASE`
SELECT CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result_default
END

-- Case with Select
(CASE WHEN column > 1 THEN 2 ELSE 1 END) AS "custom_name"; -- With alias and default value
CASE WHEN column > 1 THEN 2 END; -- With null as default value
SUM(CASE WHEN column > 1 THEN 2 END); -- With aggregation
CASE WHEN (CASE1) > 1 THEN 2 ELSE (CASE2) END; -- Nested cases, possible but use with caution

-- Case with Other Commands
WHERE (CASE WHEN column > 1 THEN 2 END) = 2; -- With where
ORDER BY (CASE WHEN column > 1 THEN 2 END) DESC; -- With order by
SELECT (CASE1) GROUP BY (CASE WHEN column > 1 THEN 2 END) AS "CASE1"; -- With group by
SELECT SUM(column) HAVING SUM(column) > (CASE WHEN column > 1 THEN 2 END); -- With having