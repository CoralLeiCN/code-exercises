# Write your MySQL query statement below
select Department.name as Department,
    Employee.name as Employee,
    Employee.salary as Salary
from Employee
    inner join (
        select departmentId,
            max(salary) as max_salary
        from Employee
        group by departmentId
    ) as t on (employee.salary = t.max_salary)
    and (employee.departmentId = t.departmentId)
    left join Department on Employee.departmentId = Department.id