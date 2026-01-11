-- Dimensión Tienda
CREATE OR REPLACE VIEW vw_dim_store AS
SELECT
	s.store_id,
	st.first_name || ' ' || st.last_name AS manager_name,
	ci.city,
	co.country
FROM store s
JOIN staff st
	ON s.manager_staff_id = st.staff_id
JOIN address a
	ON s.address_id = a.address_id
JOIN city ci
	ON a.city_id = ci.city_id
JOIN country co
	ON ci.country_id = co.country_id;


-- Tabla de hechos
CREATE OR REPLACE VIEW vw_fact_sales AS
SELECT
	p.payment_id,
	p.payment_date::date AS date_key,
	p.customer_id,
	f.film_id,
	s.store_id,
	p.amount
FROM payment p
JOIN rental r
	ON p.rental_id = r.rental_id
JOIN inventory i
	ON r.inventory_id = i.inventory_id
JOIN film f
	ON i.film_id = f.film_id
JOIN staff st
	ON p.staff_id = st.staff_id
JOIN store s
	ON st.store_id = s.store_id;

