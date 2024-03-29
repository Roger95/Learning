/*https://www.codewars.com/kata/5816a3ecf54413a113000074*/

SELECT TOTAL.MONTH::FLOAT AS MONTH, TOTAL.TOTAL_COUNT, TOTAL.TOTAL_AMOUNT, MIKE.TOTAL_COUNT AS MIKE_COUNT, MIKE.TOTAL_AMOUNT AS MIKE_AMOUNT, JON.TOTAL_COUNT AS JON_COUNT, JON.TOTAL_AMOUNT AS JON_AMOUNT
FROM
(SELECT TO_CHAR(PAYMENT_DATE,'MM') AS MONTH, COUNT(1) AS TOTAL_COUNT, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENT
GROUP BY TO_CHAR(PAYMENT_DATE,'MM')) TOTAL
JOIN
(SELECT TO_CHAR(PAYMENT_DATE,'MM') AS MONTH, COUNT(1) AS TOTAL_COUNT, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENT
WHERE STAFF_ID = 1
GROUP BY TO_CHAR(PAYMENT_DATE,'MM')) MIKE
ON TOTAL.MONTH = MIKE.MONTH
JOIN
(SELECT TO_CHAR(PAYMENT_DATE,'MM') AS MONTH, COUNT(1) AS TOTAL_COUNT, SUM(AMOUNT) AS TOTAL_AMOUNT
FROM PAYMENT
WHERE STAFF_ID = 2
GROUP BY TO_CHAR(PAYMENT_DATE,'MM')) JON
ON TOTAL.MONTH = JON.MONTH
ORDER BY TOTAL.MONTH;
