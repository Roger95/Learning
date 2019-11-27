/*https://www.hackerrank.com/challenges/challenges/problem*/

--I use this sentence three times, so better use "WITH"

WITH CHALL AS (SELECT HACKER_ID, COUNT(1) AS CHALLENGES_CREATED FROM CHALLENGES GROUP BY HACKER_ID)

--Select what we need

SELECT H.HACKER_ID, H.NAME, C.CHALLENGES_CREATED
FROM HACKERS H
JOIN
CHALL C
ON H.HACKER_ID = C.HACKER_ID

--We check the problem condition: don't take repeated numbers unless it's the top one.

WHERE C.CHALLENGES_CREATED NOT IN
(SELECT CHALLENGES_CREATED FROM
CHALL C
WHERE
/*We don't want to filter out the top one. This could be done different with TOP or LIMIT or something else, I just wanted this one.*/
CHALLENGES_CREATED != (SELECT MAX(CHALLENGES_CREATED) FROM CHALL)
GROUP BY CHALLENGES_CREATED
/*Repeated out*/
HAVING COUNT(1) > 1
)

--Order to deliver

ORDER BY 3 DESC, 1;
