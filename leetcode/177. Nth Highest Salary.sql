CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN RETURN (
    select max(salary) as getNthHighestSalary
    from (
            select salary,
                dense_rank() over (
                    order by salary desc
                ) salary_rank
            from Employee
        ) t
    where t.salary_rank = N
);
END