# Outer Query - Main Query  - executes after sub query
# Sub Query - Inner Query -- executes 1st

# customer who have placed the order
select c.customerNumber, c.customerName 
from customers c
inner join orders o
using (customerNumber);

# the same can be written using query
# main / outer query  --- inner / sub query - sub query can be multiple

select customerNumber, customerName from customers
where customerNumber in (select customerNumber from orders);

select customerNumber, customerName from customers
where customerNumber in (select customerNumber from orders where orderNumber in (select orderNumber from orderdetails));

#### customer who has not ordered anything
select customerNumber, customerName from customers
where customerNumber not in (select customerNumber from orders);

# <> not equal to for join functions