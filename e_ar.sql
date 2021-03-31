
	select Year,count(*) as n 
	from MOVIE 
	where duration >=120 
	GROUP BY Year
	having n > 20

