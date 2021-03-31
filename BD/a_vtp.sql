Select Name from CUSTOMER LEFT OUTER JOIN STREAM ON (CUSTOMER.CustomerId = STREAM.CustomerId)
WHERE StreamId is NULL AND Country = 'China'