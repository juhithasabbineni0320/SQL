##1
SELECT *
FROM sakila.customer
WHERE first_name LIKE 'J%'
AND active = 1;
##2
SELECT *
FROM sakila.film
WHERE title LIKE '%ACTION%'
   OR description LIKE '%WAR%';
## 3
SELECT *
FROM sakila.customer
WHERE last_name <> 'SMITH'
AND first_name LIKE '%a';
##4
SELECT *
FROM sakila.film
WHERE rental_rate > 3.0
AND replacement_cost IS NOT NULL;
##5
SELECT store_id,
       SUM(active = 1) AS active_customers
FROM sakila.customer
GROUP BY store_id;
##6
SELECT rating
FROM sakila.film
GROUP BY rating;
##7
SELECT rental_duration,
       COUNT(*) AS total_films,
       AVG(length) AS average_length
FROM sakila.film
GROUP BY rental_duration
HAVING AVG(length) > 100;
##8
SELECT DATE(payment_date) AS payment_day,
    SUM(amount) AS total_amount
FROM sakila.payment
GROUP by DATE(payment_date)
HAVING COUNT(*) > 100;
##9
SELECT *
FROM sakila.customer
where email IS NOT NULL
 AND email LIKE '%.org';
##10
SELECT *
From sakila.film
WHERE rating IN ('PG', 'G')
order by rental_rate DESC;
##11
SELECT length,
       COUNT(*) AS total_films
FROM sakila.film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5;
##12
SELECT a.actor_id,
       a.first_name,
       a.last_name,
       COUNT(fa.film_id) AS total_films
FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
    ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 10;
##13
SELECT title, rental_rate, length
FROM sakila.film
ORDER BY rental_rate DESC, length DESC
LIMIT 5;
##14
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_rentals
FROM sakila.customer AS c
LEFT JOIN sakila.rental AS r
    ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;
##15
SELECT f.title
FROM sakila.film AS f
LEFT JOIN sakila.inventory AS i
    ON f.film_id = i.film_id
LEFT JOIN sakila.rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(r.rental_id) = 0;
##	all custome with films they have rented 
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       f.title AS film_title
FROM sakila.customer AS c
JOIN sakila.rental AS r
    ON c.customer_id = r.customer_id
JOIN sakila.inventory AS i
    ON r.inventory_id = i.inventory_id
JOIN sakila.film AS f
    ON i.film_id = f.film_id;
##show their rental count,haven't rented any films
select c.customer_id,
       c.first_name,
       c.last_name,
       f.title AS film_title
FROM sakila.customer AS c 
LEFT JOIN sakila.customer AS r
      on c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rental DESC;
##5 ACADEMY DINOSAUR
SELECT a.actor_id,
       a.first_name,
       a.last_name
FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
	ON a.actor_id = fa.actor_id
GROUP BY st.store_id
ORDER BY st.store_id;
## staff not working in the store
SELECT
    sa.store_id,
    COUNT(st.staff_id) AS total_staff
FROM sakila.store AS sa
	LEFT JOIN sakila.staff AS st
    ON sa.store_id = st.store_id
GROUP BY sa.store_id;
##simulate using LEFT + RIGHT + UNION
select c.customer_id,
	   c.email AS customer_email,
       s.staff_id,
       s.email AS staff_email
from sakila.customers AS c 
Left join sakila.staff AS s
       on c.email = s.email
       
UNION 

SELECT
    c.customer_id,
    c.email AS customer_email,
    s.staff_id,
    s.email AS staff_email
FROM sakila.customer AS c
RIGHT JOIN sakila.staff AS s
    ON c.email = s.email;
## all films with category with film dont have a category
SELECT
    f.film_id,
    f.title AS film_name,
    c.name AS category_name
FROM sakila.film AS f
LEFT JOIN sakila.film_category AS fc
    ON f.film_id = fc.film_id
LEFT JOIN sakila.category AS c
    ON fc.category_id = c.category_id; 

