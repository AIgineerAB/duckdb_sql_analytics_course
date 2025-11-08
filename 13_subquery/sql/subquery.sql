/* ===================
Single-row subquery 
=================== */
-- the subquery returns one row
-- filter students obtaining math grade higher than the average of all students
select
   *
from
   staging.students
where
   score > (
      select
         avg(score)
      from
         staging.students
   ) -- subquery in ()
order by
   score;

/* ===================
Multi-row subquery 
=================== */
-- the subquery returns mutiple rows
-- often used with IN operator
-- filter students in classes taught by Anna S.
select
   *
from
   staging.students
where
   grade IN (
      select
         grade
      from
         staging.teachers
      where
         teacher_name = 'Anna S.'
   );

-- subquery in ()
/* ===================
Correlated subquery 
=================== */
-- the subquery depends on column values of the outer query
-- the subquery is execuated per row of the outer query
-- filter students obtaining math grade higher than the average of their own classes
select
   *
from
   staging.students s
where
   s.score > (
      select
         avg(score)
      from
         staging.students
      where
         grade = s.grade
   ) -- subquery in ()
order by
   s.grade;

-- check the resutls of the above by looking at the avg grade per class
select
   grade,
   avg(score) as class_avg_grade
FROM
   staging.students
group by
   grade;