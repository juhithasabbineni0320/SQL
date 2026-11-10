#subqueries
SELECT *
FROM sakila.customer
WHERE customer_id IN (
    SELECT customer_id
    FROM sakila.payment
    GROUP BY customer_id
    HAVING COUNT(payment_id) > 5
);
#
select first_name, last_name
from sakila.customer
where customer_id IN(
	select customer_id
    from sakila.payment
    group by customer_id
    having COUNT(payment_id) = 0
);
#
SELECT first_name, last_name
FROM sakila.customer AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM sakila.payment AS p
    WHERE p.customer_id = c.customer_id
);
#
select title, rental_rate
from sakila.film
where rental_rate >(
	select avg(rental_rate)
    from sakila.film
);
#
select f.title
from sakila.film AS f
where not exists(
	SELECT 1
    from sakila.inventory as i
    join sakila.rental as r
		 on i.inventory_id = r.inventory_id
	where i.film_id = f.film_id
);
#cte
WITH customer5_months AS (
    SELECT DISTINCT
        YEAR(rental_date) AS rental_year,
        MONTH(rental_date) AS rental_month
    FROM sakila.rental
    WHERE customer_id = 5
)
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM sakila.customer AS c
JOIN sakila.rental AS r
    ON c.customer_id = r.customer_id
JOIN customer5_months AS m
    ON YEAR(r.rental_date) = m.rental_year
   AND MONTH(r.rental_date) = m.rental_month
WHERE c.customer_id <> 5;
#
WITH avg_payment AS (
    SELECT AVG(amount) AS average_amount
    FROM sakila.payment
)
SELECT DISTINCT
    s.staff_id,
    s.first_name,
    s.last_name
FROM sakila.staff AS s
JOIN sakila.payment AS p
    ON s.staff_id = p.staff_id
CROSS JOIN avg_payment AS a
WHERE p.amount > a.average_amount;
#
with avg_duration AS (
	select avg(rental_duration) AS average_duration
    from sakila.film
)
select
	f.title,
    f.rental_duration
from sakila.film AS f
cross join avg_duration as a
where f.rental_duration > a.average_duration;
#
#DROP TEMPORARY TABLE customer1_address;
use sakila;
create temporary TABLE customer1_address AS 
select address_id
from sakila.customer
where customer_id = 1;
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.address_id
FROM sakila.customer AS c
JOIN customer1_address AS a
    ON c.address_id = a.address_id
WHERE c.customer_id <> 1;
#
create VIEW avg_payment_view AS
select avg(amount) AS avg_amount
from sakila.payment;
select *
from sakila.payment
where amount > (
	select avg_amount
    from avg_payment_view
);
    

    

