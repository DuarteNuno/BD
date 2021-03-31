Update STREAM
set charge=charge +1.5
where CustomerId in(
	select CustomerId from CUSTOMER 
	join COUNTRY On(Country=COUNTRY.Name)
	join REGION USING (RegionId)
	where REGION.Name='Europe'	
) and MovieId in(
	select MovieId from MOVIE
	join MOVIE_GENRE USING (MovieId)
	join MOVIE_ACTOR USING (MovieId)
	join ACTOR USING (ActorId)
	where ACTOR.Name ='Denzel Washington' 
);

