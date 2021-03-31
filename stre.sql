select A.Name from ACTOR A
left outer join MOVIE_ACTOR using (ActorId)
join STREAM using (MovieId)
where CustomerId LIKE 'NULL'(
    select CustomerId from CUSTOMER
    join COUNTRY on (CUSTOMER.Country = COUNTRY.Name)
    join REGION using (RegionId)
    where REGION.Name = 'Europe'
)
group by A.Name
order by A.Name;