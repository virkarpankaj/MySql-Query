# Que find max check amount
# regular method

select customerNumber, checknumber, max(amount)
from payments
group by customerNumber
order by max(amount) desc
limit 1;

# query method

select customerNumber, checknumber, amount from payments
where amount = (select max(amount) from payments);

# suppose now I dont want only max - want top 5
select distinct(customerNumber), checknumber, amount from payments
where amount in ( select amount from payments)
order by amount desc
limit 5;

# Name the customer whose amount is >= avg amount

select customerNumber, checknumber, amount from payments
where amount >= (select avg(amount) from payments);

select customername, customernumber from customers
where customerNumber In (select customerNumber from payments where amount >= ( select avg(amount) from payments));

