# Correlated Subquery
# main query  - execute 1st
select productname,productline, buyprice from products p1
# subquery - execute 2nd
where buyPrice > (select avg(buyprice) from products p2 where p1.productLine = p2.productLine )
order by productLine, buyPrice Desc;
