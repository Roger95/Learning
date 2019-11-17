/*https://www.codewars.com/kata/592b1e4c96cc12de1e0000b1*/

SELECT array_agg(result_set.res order by result_set.columnas) as matrix from
(SELECT valores.num_fila as num_fila, valores.columnas as columnas, array_agg(valores.valor order by valores.filas) as res from
  (SELECT c.num_fila as num_fila, c.filas as filas, c.columnas as columnas, c.matrix[c.filas][c.columnas] as valor from
    (SELECT f.num_fila as num_fila, f.filas as filas, generate_subscripts(f.matrix,2) as columnas, f.matrix as matrix from
      (SELECT ROW_NUMBER() OVER () AS num_fila, /*Added to order.*/
        generate_subscripts(matrix,1) as filas,
        matrix
        from public.matrices
      ) f /*The input is an actual matrix, not a string nor a number.
      "Generate subscripts" can count the number of elements in the dimension of an array.*/
    ) c  /*Checking the second dimension.*/
  ) valores /*Once you got rows and columns, you can get that value from the matrix directly with matrix[i][j] in array format ["value"].*/
  group by valores.num_fila, valores.columnas /*"array agg" is another new func.tion I learnt. "Groups" values grouping by columns in this case, array format.*/
) result_set /*Using "array agg" again, grouping by rows.*/
group by result_set.num_fila
order by result_set.num_fila; /*Added when refactoring as some people pointed out this was a must.*/
