/*https://www.hackerrank.com/challenges/the-pads/problem*/

SELECT NAME ||'('|| SUBSTR(OCCUPATION,1,1) ||')' AS SELECCION FROM OCCUPATIONS ORDER BY NAME ASC ;
SELECT 'There are a total of ' || count(1) || ' ' || LOWER(OCCUPATION) || 's.' FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(1) ASC, OCCUPATION ASC;
