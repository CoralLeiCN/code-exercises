WITH lead_manager_cnt AS (
    SELECT company_code,
        count(distinct lead_manager_code) as cnt
    FROM Lead_Manager
    group by company_code
),
Senior_Manager_cnt AS (
    SELECT company_code,
        count(distinct senior_manager_code) as cnt
    FROM Senior_Manager
    group by company_code
),
Manager_cnt AS (
    SELECT company_code,
        count(distinct manager_code) as cnt
    FROM Manager
    group by company_code
),
Employee_cnt AS (
    SELECT company_code,
        count(distinct employee_code) as cnt
    FROM Employee
    group by company_code
)
select Company.company_code,
    Company.founder,
    lead_manager_cnt.cnt,
    Senior_Manager_cnt.cnt,
    Manager_cnt.cnt,
    Employee_cnt.cnt
from Company
    left join lead_manager_cnt on Company.company_code = lead_manager_cnt.company_code
    left join Senior_Manager_cnt on Company.company_code = Senior_Manager_cnt.company_code
    left join Manager_cnt on Company.company_code = Manager_cnt.company_code
    left join Employee_cnt on Company.company_code = Employee_cnt.company_code
order by Company.company_code