use industry;

show tables;

select cid, cname, ccity1 from c;

use world;

select city.name, city.district, country.capital from city join country on city.countrycode=country.code;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;



SELECT columns  
FROM table1   
INNER JOIN table2  
ON table1.column = table2.column;  








