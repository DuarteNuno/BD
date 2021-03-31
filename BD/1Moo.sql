/* A:Select COUNT() from DEPARTMENT;/

/Bselect AVG(Duration) from MOVIE where YEAR>=2000;/

/Cselect COUNT(DISTINCT City) from CUSTOMER;/

/Dselect Min(Charge),MAX(Charge),AVG(Charge),Sum(Charge) from STREAM where year(StreamDate)=2017;/

/E select Year,Count(MovieId) from MOVIE group by Year order by Year desc/;

/F- SELECT Year,COUNT(MovieId) FROM MOVIE GROUP BY Year ORDER BY COUNT(MovieID) DESC LIMIT 5;*/

/* G SELECT Year,COUNT(MovieId) FROM MOVIE WHERE Duration>=120 GROUP BY Year HAVING COUNT(MovieID)>=10 ORDER BY COUNT(MovieId) DESC, Year;*/

/* H SELECT Hour(StreamDate), COUNT(*) FROM STREAM GROUP BY Hour(StreamDate); */

/* I SELECT Year(StreamDate),Month(StreamDate),SUM(Charge) FROM STREAM GROUP BY Year(StreamDate),Month(StreamDate);*/

/* J SELECT CustomerId, SUM(Charge) FROM STREAM GROUP BY CustomerId HAVING SUM(Charge)<=100 ORDER BY SUM(Charge) DESC, CustomerId;*/
