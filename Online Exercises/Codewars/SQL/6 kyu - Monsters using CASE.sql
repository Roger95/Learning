/*https://www.codewars.com/kata/593ef0e98b90525e090000b9*/

SELECT TOP.ID, TOP.HEADS, BOT.LEGS, TOP.ARMS, BOT.TAILS, CASE WHEN TOP.HEADS > TOP.ARMS OR BOT.TAILS > BOT.LEGS THEN 'BEAST' ELSE 'WEIRDO' END AS SPECIES
FROM TOP_HALF TOP JOIN BOTTOM_HALF BOT
ON TOP.ID = BOT.ID
ORDER BY SPECIES;
