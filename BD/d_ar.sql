select Year(StreamDate) , count(*), sum(charge) 
from STREAM  
GROUP BY Year(StreamDate)