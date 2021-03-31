Select MOVIE.MovieId,REGION.Name,COUNT(*) as n 
from MOVIE
    left outer join STREAM USING(MovieId)
	left outer join CUSTOMER USING(CustomerId)
	left outer join COUNTRY ON (CUSTOMER.Country=COUNTRY.Name)
	left outer Join REGION using (RegionId)
	where REGION.Name<>'EUROPE' 
	GROUP BY 1
	Having n<2
	order by 3;

      

