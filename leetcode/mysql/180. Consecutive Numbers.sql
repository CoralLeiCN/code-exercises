# Write your MySQL query statement below
# guess better to use join because there is a gap in the id.
select distinct num as ConsecutiveNums
from (
        select id,
            num,
            lag(num, 1) over (
                order by id asc
            ) as num_offset_1,
            lag(num, 2) over (
                order by id asc
            ) as num_offset_2,
            lag(id, 1) over (
                order by id asc
            ) as id_offset_1,
            lag(id, 2) over (
                order by id asc
            ) as id_offset_2
        from Logs
    ) t
where (
        t.num = t.num_offset_1
        and t.num = t.num_offset_2
    )
    And (
        t.id - 1 = t.id_offset_1
        and t.id - 2 = t.id_offset_2
    )