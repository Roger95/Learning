/*https://www.codewars.com/kata/5811315e04adbbdb5000050e*/

SELECT ID,
COALESCE(NULLIF(NAME,''), '[product name not found]') AS NAME,
PRICE,
COALESCE(NULLIF(CARD_NAME,''), '[card name not found]') AS CARD_NAME,
CARD_NUMBER,
TRANSACTION_DATE
FROM EUSALES
WHERE PRICE IS NOT NULL AND PRICE > 50;
