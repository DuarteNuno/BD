Update CUSTOMER 
set Active=False
where Country in(
	select C.Name from COUNTRY as C
	join REGION USING (RegionId)
	where REGION.Name='Africa' 
) and CustomerId not in(
	select CustomerId from STREAM
	where YEAR(StreamDate) >=2018
	and MONTH(StreamDate) >=9
);