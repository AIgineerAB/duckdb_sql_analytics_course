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
   grade_math > (
      select
         avg(grade_math)
      from
         staging.students
   ) -- subquery in ()
order by
   grade_math;

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
   class_name IN (
      select
         class_name
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
   s.grade_math > (
      select
         avg(grade_math)
      from
         staging.students
      where
         class_name = s.class_name
   ) -- subquery in ()
order by
   s.class_name;

-- check the resutls of the above by looking at the avg grade per class
select
   class_name,
   avg(grade_math) as class_avg_grade
FROM
   staging.students
group by
   class_name;