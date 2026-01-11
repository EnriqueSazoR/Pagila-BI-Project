-- Creación de Vistas

-- Dimensión Fecha
CREATE OR REPLACE VIEW vw_dim_date AS
SELECT DISTINCT
	payment_date::date                 AS date_key, -- Elimina la hora, únicamente se queda la fecha
	EXTRACT(YEAR FROM payment_date)    AS year,
	EXTRACT(MONTH FROM payment_date)   AS month,
	TO_CHAR(payment_date, 'Month')     AS month_name,
	EXTRACT(DAY FROM payment_date)     AS day,
	EXTRACT(QUARTER FROM payment_date) AS quarter,
	TO_CHAR(payment_date, 'Day')       AS day_of_week
FROM public.payment;

-- Dimensión Cliente
CREATE OR REPLACE VIEW vw_dim_customer AS
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email,
	a.address,
	a.district,
	ci.city,
	co.country,
	c.active
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- Dimensión Película
CREATE OR REPLACE VIEW vw_dim_film AS
SELECT
	f.film_id,
	f.title,
	f.release_year,
	c.name AS category,
	l.name AS language,
	f.length,
	f.rating,
	f.rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
JOIN (
	SELECT 
		film_id,
		MIN(category_id) AS category_id
	FROM film_category
	GROUP BY film_id
)fc
	ON f.film_id = fc.film_id
JOIN category c
	ON fc.category_id = c.category_id;


	