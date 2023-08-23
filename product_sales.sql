SELECT * FROM products.extra;

select * from extra
where boxes between 500 and 3100
order by boxes desc
limit 20;

Select sales_person, sum(amount) 'Total Amount', count(customers) Count_of_customers, count(boxes) 'Total Box'
from extra
group by sales_person;

select geography, sum(amount) 'Total Amount'-- , count(customers) Number_of_customers, count(boxes) 'Total Box'
from extra -- where Geography='New Zealand'
group by geography
order by sum(amount) desc;

select sales_person, geography, product, amount/boxes 'Amount Per Box', amount, boxes
from extra
where amount/boxes > 15
group by sales_person;

select geography, count(geography) 'Number of geographies'
from extra -- where Geography='New Zealand'
group by geography
order by geography asc;

select geography, sum(amount) 'Total Amount'-- , count(customers) Number_of_customers, count(boxes) 'Total Box'
from extra where Geography='New Zealand';


# categorising the Amount column

select Sales_Person, count(sales_person) 'Number of Sales Person', Amount,
	case 	when amount < 1000 then 'Under 1k'
			when amount < 2000 then 'Under 5k'
            when amount < 3000 then 'Under 10k'
		else 'More than 10k'
	end as 'Amount Category'
from extra
group by Sales_Person
order by count(sales_person) desc;

select *,
	case 	when amount < 1000 then 'Under 1k'
			when amount < 5000 then 'Under 5k'
            when amount < 10000 then 'Under 10k'
		else 'More than 10k'
	end as 'Amount Category'
from extra
group by Sales_Person
order by Amount desc;
