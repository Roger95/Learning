/*https://www.hackerrank.com/challenges/weather-observation-station-20/problem*/

SELECT ROUND(LAT_N,4) FROM
(SELECT ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS FILA,
    LAT_N FROM STATION)
WHERE FILA = ROUND((SELECT COUNT(1) FROM STATION)/2);
