select StaffId from STAFF where Supervisor is NULL
UNION
Select Manager from DEPARTMENT
