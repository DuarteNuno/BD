select A.Name
from MOVIE_ACTOR MA
natural join STREAM S
natural join CUSTOMER CR
join COUNTRY CY on (CY.Name = CR.Country)
join REGION R on (R.RegionId = CY.RegionId AND R.Name = 'Europe')
right outer join ACTOR A using (ActorId)
where S.StreamId is NULL
order by A.Name;