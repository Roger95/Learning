/*https://www.codewars.com/kata/589e0837e10c4a1018000028*/

select q2.date as date, q2.count as count, case when q1.date is not null then round(((q2.count::decimal / q1.count )-1)*100,1) || '%' else null end as percent_growth
from
(select date_trunc('month', created_at)::date as date, count(1) as count from posts group by date_trunc('month', created_at)::date) q2
left join
(select date_trunc('month', created_at)::date as date, count(1) as count from posts group by date_trunc('month', created_at)::date) q1
on q1.date = q2.date - INTERVAL '1 MONTH'
order by q2.date asc;
