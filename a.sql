select REGION.Name,STAFF.Name from REGION join STAFF ON (REGION.RegionManager = STAFF.StaffId) order by REGION.Name;