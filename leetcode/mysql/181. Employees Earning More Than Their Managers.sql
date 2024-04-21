# Write your MySQL query statement below
select name as Employee
from employee
    left join (
        select salary as manager_salary,
            id as managerid
        from employee
    ) as manager on employee.managerid = manager.managerid
where salary > manager_salary