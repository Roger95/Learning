/*https://www.codewars.com/kata/58164ddf890632ce00000220*/

SELECT AGE, COUNT(*) TOTAL_PEOPLE
FROM PEOPLE
GROUP BY AGE
HAVING COUNT(*) >=10;