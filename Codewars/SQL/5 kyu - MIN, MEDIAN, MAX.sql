/*https://www.codewars.com/kata/58167fa1f544130dcf000317*/

SELECT MIN(SCORE), percentile_CONT(0.5) within group (order by RESULT.SCORE) AS MEDIAN, MAX(SCORE)
FROM RESULT;
