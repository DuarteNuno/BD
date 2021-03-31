select Country,Count(*) from STREAM RIGHT OUTER JOIN CUSTOMER 
ON (STREAM.CustomerId = CUSTOMER.CustomerId)
WHERE StreamId is NULL 
GROUP BY Country