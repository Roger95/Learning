/*https://www.codewars.com/kata/581676828906324b8b00059e*/

SELECT *
FROM product
  WHERE to_tsvector(name) @@ to_tsquery('Awesome');
