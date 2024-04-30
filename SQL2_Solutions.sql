--SQL 2 SOlutions

--1)Rank scores - Problem No :- 4
select 
score, 
dense_rank() over (order by score desc) as 'rank'
from scores;


--2) Exchange seats - Problem No :- 5
select  id,
case when id%2 =1 then ifnull(lead(student) over (),student)
when id%2 = 0 then lag(student) over()
else student end as student
 from seat;


--3) Tree Node  - Problem No :- 6
select 
t1.id,case when t1.p_id is null then 'Root'
when t1.p_id is not null and t2.p_id is not null then 'Inner'
else 'Leaf' end as type  from Tree t1
left join tree t2
on t1.id = t2.p_id
group by 1,2;



-- 4) Department Top 3 Salaries - Problem No :- 7
select department, employee, Salary from
(select d.name as department, e.name as employee, Salary,
dense_rank() over (partition by d.name order by salary desc)  as rnk from Employee e
inner join Department d
on e.departmentId = d.id) a 
where rnk <=3;
