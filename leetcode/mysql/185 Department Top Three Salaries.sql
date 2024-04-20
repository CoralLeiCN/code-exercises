select department.name as Department,
    t.name as employee,
    t.salary as Salary
from (
        select id,
            name,
            salary,
            departmentid,
            (
                dense_rank() over (
                    partition by departmentId
                    order by salary desc
                )
            ) as salary_rank
        from employee
    ) t
    left join department on t.departmentid = department.id
where t.salary_rank <= 3