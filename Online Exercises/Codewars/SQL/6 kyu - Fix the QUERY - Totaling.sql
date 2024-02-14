/*https://www.codewars.com/kata/582cba7d3be8ce3a8300007c*/

SELECT
  to_date(to_char(s.transaction_date,'YYYY-MM-DD'),'YYYY-MM-DD') as day,
  d.name as department,
  COUNT(*) as sale_count
  FROM department d
    JOIN sale s on d.id = s.department_id
  group by to_date(to_char(s.transaction_date,'YYYY-MM-DD'),'YYYY-MM-DD'), d.name
  order by to_date(to_char(s.transaction_date,'YYYY-MM-DD'),'YYYY-MM-DD') ASC;
