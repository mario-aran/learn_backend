-- OJO ESTA LECCIÓN NO ESTA COMPLETA

/* Lesson 11: Window Functions */

/* 1. Common Windows Functions */
ROW_NUMBER() OVER (PARTITION BY column ORDER BY column);
RANK() OVER (PARTITION BY column ORDER BY column);
DENSE_RANK() OVER (PARTITION BY column ORDER BY column);
NTILE(4) OVER (PARTITION BY column ORDER BY column);
SUM(column) OVER (PARTITION BY column ORDER BY column);
AVG(column) OVER (PARTITION BY column ORDER BY column);
MIN(column) OVER (PARTITION BY column ORDER BY column);
MAX(column) OVER (PARTITION BY column ORDER BY column);
LEAD(column, 1) OVER (PARTITION BY column ORDER BY column);
LAG(column, 1) OVER (PARTITION BY column ORDER BY column);