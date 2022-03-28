# exist subquery  - True / False Output
# when  exist subquery  output is true Main query is executed or else not

select customername, customernumber 
from customers
where exists
(select ordernumber,
sum(priceeach* quantityordered)total
from orderdetails
inner join orders 
using (ordernumber)
group by ordernumber
Having sum(priceeach* quantityordered)>60000
);

select customername, customernumber 
from customers
where Not exists
(select ordernumber,
sum(priceeach* quantityordered)total
from orderdetails
inner join orders 
using (ordernumber)
group by ordernumber
Having sum(priceeach* quantityordered)>60000
);