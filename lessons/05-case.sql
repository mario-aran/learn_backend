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
CASE WHEN (case1) > 1 THEN 2 ELSE (case2) END; -- Nested cases, possible but use with caution

-- Case with Other Commands
WHERE (CASE WHEN column > 1 THEN 2 END) = 2; -- With where
ORDER BY (CASE WHEN column > 1 THEN 2 END) DESC; -- With order by
SELECT (CASE WHEN column > 1 THEN 2 END) GROUP BY (CASE WHEN column > 1 THEN 2 END); -- With group by
SELECT SUM(column) HAVING SUM(column) > (CASE WHEN column > 1 THEN 2 END); -- With having