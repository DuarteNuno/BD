(SELECT S1.Name AS Supervised, S2.Name AS Supervisor
FROM STAFFS1 LEFT OUTER JOIN STAFFS2 
ON(S1.Supervisor = S2.StaffId)) 
UNION 
(SELECT S1.Name AS Supervised, S2.Name AS Supervisor
FROM STAFFS1  
RIGHT OUTER JOIN STAFFS2 
ON(S1.Supervisor = S2.StaffId)) 
ORDER BY Supervised, Supervisor