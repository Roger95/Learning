/*https://www.hackerrank.com/challenges/occupations/problem*/

SELECT DOCTOR, PROFESSOR, SINGER, ACTOR
FROM
  ( SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME ASC) as "FILA",
        NAME,
        OCCUPATION
        FROM OCCUPATIONS
  )
  PIVOT
    ( MAX(NAME) FOR OCCUPATION IN
        (
          'Doctor' as "DOCTOR",
          'Professor' as "PROFESSOR",
          'Singer' as "SINGER",
          'Actor' as "ACTOR"
        )
    )
ORDER BY FILA;
