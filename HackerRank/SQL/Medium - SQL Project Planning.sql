/*https://www.hackerrank.com/challenges/sql-projects/problem*/

/*I wanted dates to be ordered.*/
WITH PROJECT AS
(
  SELECT ROW_NUMBER() OVER (ORDER BY START_DATE) AS FILA, 
    START_DATE AS INICIO, END_DATE AS FIN
  FROM PROJECTS
),
/*I assigned a project number to each day depending on if the row before (they were ordered) ended the same day this row starts.
If that's true, I assign the same project number. Otherwise, one more.*/
PROJ_NUMBER (PROJ_NUM, FILA, INICIO, FIN) AS
(
    /*Starting row, starting project.*/
    SELECT 1 AS PROJ_NUM, P1.FILA AS FILA, P1.INICIO AS INICIO, P1.FIN AS FIN FROM PROJECT P1 WHERE P1.FILA = 1
    UNION ALL
    /*Assigning project number.*/
    SELECT CASE WHEN P2.FIN = P.INICIO THEN P2.PROJ_NUM ELSE P2.PROJ_NUM+1 END,
    P.FILA, P.INICIO, P.FIN FROM PROJECT P JOIN PROJ_NUMBER P2 ON P.FILA = P2.FILA+1 /*Comparing with the row before.*/
) /*Grouping by project, select start, end dates.*/
SELECT MIN(INICIO) AS STARTING_DATE, MAX(FIN) AS FINISHING_DATE FROM PROJ_NUMBER
GROUP BY PROJ_NUM
/*Ordering by difference ascending, start ascending.*/
ORDER BY MAX(FIN)-MIN(FIN) ASC, MIN(FIN) ASC;
