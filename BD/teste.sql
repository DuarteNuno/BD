select StreamDate, Title, Name, Country from STREAM
join CUSTOMER on(STREAM.CustomerId=CUSTOMER.CustomerId)
join MOVIE on(STREAM.MovieId=MOVIE.MovieId)
where MOVIE.MovieId in (
    select MovieId from MOVIE_ACTOR
    natural join ACTOR
    where Name = 'Brad Pitt'
)
and MOVIE.MovieId in (
    select MovieId from MOVIE_GENRE
    natural join GENRE
    where Label <> 'Action'
)
and CUSTOMER.CustomerId in (
    select CustomerId from CUSTOMER
    where Country <> 'United States'
)
order by StreamDate desc
limit 20;