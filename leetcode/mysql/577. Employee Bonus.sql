select name,
    bonus
from employee as a
    left join bonus as b on a.empid = b.empid
where bonus < 1000
    or isnull(bonus)