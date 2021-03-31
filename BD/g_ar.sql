Select DepId,DEPARTMENT.Name,Manager,STAFF.Name
from DEPARTMENT JOIN STAFF ON (Manager = StaffId) 