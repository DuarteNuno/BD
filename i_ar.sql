Select Title, Duration , Year, StreamDate 
from MOVIE NATURAL JOIN STREAM
where Duration >=140 and Year = Year(StreamDate)-1	 