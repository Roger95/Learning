/*https://www.hackerrank.com/challenges/weather-observation-station-20/problem*/

SELECT ROUND(LAT_N,4) FROM
(SELECT ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS FILA,
    LAT_N FROM STATION)
WHERE FILA = ROUND((SELECT COUNT(1) FROM STATION)/2);


--Someone asked on Hackerrank what if there was an even amount of rows.

SELECT ROUND((T1.LAT_N+T2.LAT_N)/2,4) FROM
(SELECT LAT_N FROM
(SELECT ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS FILA,
    LAT_N FROM STATION)
WHERE FILA = ROUND((SELECT COUNT(1) FROM STATION)/2)) T1
JOIN
/*We get the same number again if there are odd amount of rows and the next row if there are even amount of rows,
and we'll divide by 2. This way we average the 2 numbers in the middle.*/
(SELECT LAT_N FROM
(SELECT ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS FILA,
    LAT_N FROM STATION)
WHERE FILA = CASE WHEN MOD((SELECT COUNT(1) FROM STATION),2) = 0 --Odd amount of rows
 THEN ROUND(((SELECT COUNT(1) FROM STATION)+1)/2)
 ELSE
 ROUND((SELECT COUNT(1) FROM STATION)/2) --Even amount of rows
END
) T2
ON 1=1
;

--Median on even numbers is the average between the two in the middle.
