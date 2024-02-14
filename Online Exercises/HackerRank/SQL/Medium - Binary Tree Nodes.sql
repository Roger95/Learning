/*https://www.hackerrank.com/challenges/binary-search-tree-1/problem*/

SELECT N, CASE WHEN P IS NULL THEN 'Root' ELSE CASE WHEN CONNECT_BY_ISLEAF = 1 THEN 'Leaf' ELSE 'Inner' END END
FROM BST
START WITH N = (SELECT N FROM BST WHERE P IS NULL)
CONNECT BY PRIOR N = P
ORDER BY 1;
