 select * from sales
where amount >2000 AND boxes < 100;


SELECT s.SPID, p.Salesperson, COUNT(*)
FROM sales AS s
JOIN people AS p ON s.SPID = p.spid
WHERE SaleDate BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY s.SPID, p.Salesperson;
select*from products ;

select s.PID ,p.product,sum(boxes) as 'Totale Boxes'
from sales as s
join products as p
on s.PID = p.PID
where product in('Milk Bars' , 'Eclairs')
group by s.PID,p.Product;

select p.product,sum(boxes) as 'Totale Boxes'
from sales as s
join products as p
on s.PID=p.PID
WHERE s.saleDate between '2022-02-01' and '2022-02-07'
and p.product in('Milk Bars' , 'Eclairs')
GROUP BY p.product
order by sum(boxes) desc;



select * from sales 
where customers<100
AND boxes <100
AND dayofweek(SaleDate)= 2;

select*,
case
when dayofweek(SaleDate)=2 THEN 'WENDENSDAY SHAPEMENT'
ELSE ''
end as 'w s'
from sales
where customers<100
AND boxes <100;


SELECT distinct Salesperson
FROM sales as s
join people as p
on s.SPID = p.SPID
WHERE boxes >=1
and SaleDate between '2022-01-01' and '2022-01-07';

SELECT distinct Salesperson
FROM sales as s
join people as p
on s.SPID = p.SPID
WHERE boxes < 1
and SaleDate between '2022-01-01' and '2022-01-07';

select p.salesperson
from people p
where p.spid not in
(select distinct s.spid from sales s where s.SaleDate between ‘2022-01-01’ and ‘2022-01-07’);
SELECT*FROM products

SELECT s.boxes,p.Product,g.Geo
FROM sales  as s
join products as p
on s.PID= p.PID
join Geo as g
on s.GeoIG = g.GeoID
where boxes >=1
AND Product='After Nines'
and GeoID ='New Zealand'
