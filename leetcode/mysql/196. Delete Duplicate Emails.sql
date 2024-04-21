# Write your MySQL query statement below
delete a
from person a,
    person b
where a.id > b.id
    and a.email = b.email