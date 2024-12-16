/* Case Statements */

/* `CASE` */
SELECT CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result_default
END

/* Case in `SELECT` */
(CASE WHEN price = 1 THEN 1 END) AS "custom_name"; -- Alias and Null as default value
CASE WHEN price = 1 THEN 1 ELSE 2 END; -- Default value
SUM(CASE WHEN price = 1 THEN 1 END); -- Aggregate function
CASE WHEN (case1) > 1 THEN 2 ELSE (case2) END; -- Nested cases

/* Case with Other Commands */
WHERE (CASE WHEN price = 1 THEN 1 END) = 1; -- Where
ORDER BY (CASE WHEN price = 1 THEN 1 END) DESC; -- Order By
SELECT (case1) GROUP BY (CASE WHEN price = 1 THEN 1 END); -- Group By
SELECT SUM(price) HAVING SUM(price) > (CASE WHEN price = 1 THEN 1 END); -- Having