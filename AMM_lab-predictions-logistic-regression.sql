use sakila;

-- In order to optimize our inventory, we would like to know which films will be rented next month and 
-- we are asked to create a model to predict it.

-- Create a query or queries to extract the information you think may be relevant for building the prediction model. 
-- It should include some film features and some rental features.

SELECT
    f.film_id,
    f.title,
    f.release_year,
    f.rental_duration,
    f.rental_rate,
    f.length,
    f.replacement_cost,
    f.rating,
    COUNT(r.rental_id) AS total_rentals
FROM
    film f
LEFT JOIN
    inventory i ON f.film_id = i.film_id
LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id
ORDER BY
    total_rentals DESC;
    
    