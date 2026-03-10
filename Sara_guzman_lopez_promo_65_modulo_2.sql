USE sakila;

/*EJERCICIO 1
Selecciona todos los nombres de las películas sin que aparezcan duplicados*/

SELECT DISTINCT title  AS titulo  -- pongo AS para renombrar a la columna
FROM film; 

/*EJERCICIO 2
Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
*/

SELECT  title AS titulo,-- pongo alias, en este caso, para que la columna aparezca nombrada como yo necesito
		rating AS clasificacion
FROM film
WHERE rating ='PG-13' ;

/*EJERCICIO 3
Encuentra el título y la descripción de todas las películas que 
contengan la palabra "amazing" en su descripción.
*/

SELECT title AS Titulo, 
		description AS Descripcion 
FROM Film
WHERE description LIKE '% amazing %';-- al poner la palabra entre % nos aseguramos que la encuentre



/*EJERCICIO 4
Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
*/
SELECT  title AS titulo,
		length AS duracion
FROM film
WHERE length >120;

/*EJERCICIO 5
Recupera los nombres de todos los actores.
*/

SELECT   concat (first_name ,'  ' , last_name ) as nombre -- pongo comillas con espacio en blanco para que se vea nombre, espacio, apellido, quedando asi mas natural 
FROM actor;

/*EJERCICIO 6
Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
*/

SELECT  first_name AS nombre,
		last_name AS apellido
FROM actor
WHERE last_name  LIKE '%GIBSON%'; -- con '%like%' encontramos la palabra que queremos buscar

/*EJERCICIO 7
Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20
*/

SELECT  actor_id,-- no me lo piden pero lo pongo para comprobar tanto la alumna como el examinador
		 concat (first_name ,'  ' , last_name ) as nombre -- incluyo un concat para que en una sola columna me ponga el nombre y apellidos, separado por un espacio
        FROM actor
WHERE actor_id BETWEEN 10 AND 20;


 -- query final
SELECT  concat (first_name ,'  ' , last_name ) as nombre 
        FROM actor
WHERE actor_id BETWEEN 10 AND 20;



/*EJERCICIO 8
Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación.
*/

SELECT  title AS titulo,
		rating as clasificacion
FROM film
WHERE rating not in ('r','PG-13') ;-- pongo un in y asi me lo hago como lista y no como condiciones encadenadas con and o or

 -- query final
SELECT  title AS titulo
FROM film
WHERE rating not in ('r','PG-13') ;

/*EJERCICIO 9
Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento.
*/

SELECT  rating AS clasificacion,
		COUNT(film_id) AS total_peliculas
FROM film
GROUP BY rating
ORDER BY total_peliculas DESC; -- ordeno de mayor a menor segun categoria


/*EJERCICIO 10
Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
su nombre y apellido junto con la cantidad de películas alquiladas.
*/

SELECT *
FROM rental;

SELECT c.customer_id,
		c.first_name,
        c.last_name,
		count(r.rental_id) AS total_alquiladas
FROM customer AS c
	INNER JOIN rental AS r
		ON  c.customer_id=r.customer_id
GROUP BY c.customer_id, 
		c.first_name,
        c.last_name
ORDER BY total_alquiladas asc; -- ordeno de menos alquiladas a mas
	

/*EJERCICIO 11
Encuentra la cantidad total de películas alquiladas por categoría y
 muestra el nombre de la categoría junto con el recuento de alquileres.*/


SELECT  c.name as categoria,
		count(r.rental_id) AS total_alquiladas

FROM   category AS c
	INNER JOIN film_category AS fc
		ON c.category_id =fc.category_id -- de categoria a film categories
	INNER JOIN film AS f
		ON fc.film_id=f.film_id -- de film categoria a film
	INNER JOIN inventory AS i
		ON f.film_id = i.Film_id -- de film a inventory
	INNER JOIN  rental As r
		ON i.inventory_id= r.inventory_id

GROUP BY c.name
ORDER BY total_alquiladas DESC;

    
/*EJERCICIO 12
Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración.
*/

SELECT c.name AS clasificacion,
		AVG (f.length)  AS promedio_duracion -- avg saca la media
        
FROM category AS c           -- unir tablas para llegar de una tabla a otra a buscar resultados de category a film pasando por film_category
		INNER JOIN film_category AS fc
			ON c.category_id=fc.category_id
		INNER	JOIN film AS f
			ON fc.film_id= f.film_id

GROUP BY c.name 
ORDER BY promedio_duracion DESC;



/*EJERCICIO 13
Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love"
*/

SELECT  a.first_name , a.last_name,
        f.title AS titulo
 
FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id=fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id=f.film_id

WHERE f.title = "Indian Love";
		

/*EJERCICIO 14
Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción
*/

SELECT title
FROM film
WHERE description LIKE '%dog%' or description LIKE '%cat%';


/*EJERCICIO 15
.Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor.
*/
SELECT actor_id
from actor
ORDER BY actor_id DESC;
select DISTINCT actor_id
from film_actor
ORDER BY actor_id DESC;

-- query final 
SELECT Concat (a.first_name,'  ',a.last_name) as nombre, -- si hubiera alguno ponemos nombre e id de las 2 tablas para localizarlo
			a.actor_id,
            fa.actor_id
FROM actor as a
	LEFT JOIN film_actor as fa 
		ON a.actor_id =fa.actor_id
WHERE fa.actor_id is null; 
-- esta query se devuelve vacia por lo tanto hay 0 actores/actrices que no aparezcan en ninguna pelicula de la tabla film_act

/*EJERCICIO 16
Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010
*/
SELECT title,release_year
FROM film;
select *
from film;
SELECT DISTINCT release_year -- compruebo que todas las peliculas son del 2006
FROM film;

-- query limpia


SELECT title
FROM film
where release_year BETWEEN 2005 and 2010;


/*EJERCICIO 17
Encuentra el título de todas las películas que son de la misma categoría que "Family".
*/

SELECT f.title -- ,c.name para comprobar la categoria 
FROM category AS c
	INNER JOIN film_category AS fc
		ON c.category_id=fc.category_id
	INNER JOIN film AS f
		ON fc.film_id=f.film_id
WHERE c.name like '%Family%'; -- tb se puede hacer c.name ='family'



/*EJERCICIO 18
Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
*/
SELECT a.first_name AS nombre_actor,
		a.last_name AS apellido_actor,
		count(fa.film_id) as total_peliculas -- tabla donde se une actor_id y film_id
FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id=fa.actor_id
   INNER JOIN film AS f
		ON fa.film_id=f.film_id
GROUP BY  nombre_actor,
		  apellido_actor
HAVING total_peliculas > 10
ORDER BY total_peliculas ASC; -- ordeno de menos peliculas  a mas para comprobar que no hay ninguno con menos de 10

-- query limpia


SELECT a.first_name AS nombre_actor,
		a.last_name AS apellido_actor
FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id=fa.actor_id
   INNER JOIN film AS f
		ON fa.film_id=f.film_id
GROUP BY  nombre_actor,
		  apellido_actor
HAVING count(fa.film_id)>10 -- si no quiero que el total peliculas lo vea , lo meto en el having
ORDER BY  count(fa.film_id)>10 desc;



/*EJERCICIO 19
Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/

SELECT title-- compruebo con,length as duraccion , rating as categoria
FROM film
WHERE rating ='R'AND length>120
ORDER BY length DESC;-- de la corta a la mas larga y compruebo condicion




/*EJERCICIO 20
Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.
*/

SELECT 
    c.name AS categoria,
    AVG(f.length) AS promedio_duracion
FROM category AS c
INNER JOIN film_category AS fc 
    ON c.category_id = fc.category_id
INNER JOIN film AS f 
    ON fc.film_id = f.film_id
GROUP BY c.name
HAVING AVG(f.length) > 120
ORDER BY promedio_duracion ASC; -- compruebo que ninguna esta sobre los 120 minutos



/*EJERCICIO 21
Encuentra los actores que han actuado en al menos 5 películas y
 muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
 */

SELECT a.first_name AS nombre_actor,
	   count(fa.film_id) as total_peliculas -- tabla donde se une actor_id y film_id
FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id=fa.actor_id
 GROUP BY  nombre_actor
HAVING total_peliculas >=5
ORDER BY total_peliculas ASC; -- ordeno de menos peliculas  a mas para comprobar que no hay ninguno con menos de 5


/*EJERCICIO 22
Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y
luego selecciona la películas correspondientes.
*/


-- primero sacar el tiempo de alquiler

SELECT rental_id,
		datediff(return_date,rental_date ) as numero_dias_alquilado
From rental;

-- hacemos conexion entre tablas 

SELECT f.title
FROM film AS f 
	INNER JOIN inventory AS i -- de film a inventory, film_id
		ON f.film_id=i.film_id
	INNER JOIN rental AS r --  de inventory a rental, inventory_id
		ON i.inventory_id=r.inventory_id;
        
        

-- creamos sub-consultas

SELECT DISTINCT f.title as titulo,
    DATEDIFF(r.return_date, r.rental_date) AS num_dias_alquilado
FROM film AS f
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id
	INNER JOIN rental AS r 
		ON i.inventory_id = r.inventory_id
WHERE r.rental_id IN (
						SELECT rental_id
						FROM rental
						WHERE DATEDIFF(return_date, rental_date) > 5);



/*EJERCICIO 23
Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría"Horror".
 Utiliza una subconsulta para encontrar los actores que han actuado en películas de la
categoría "Horror" y luego exclúyelos de la lista de actores.
*/

-- PARTE 1, Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría"Horror".


 -- sacamos la correspondencia de tabla a tabla;
 SELECT 
    c.name AS categoria,
    a.first_name AS nombre_actor,
    a.last_name AS apellido_actor
FROM actor AS a -- de actor a film_actor , actor_id
		INNER JOIN film_actor AS fa
			ON a.actor_id=fa.actor_id
		INNER JOIN  film AS f -- de film_actor a film , actor_id
			ON fa.actor_id =f.actor_id
		INNER JOIN film_category  AS fc-- de film a film_category , film_id
			ON f.film_id =fc.film_id
		INNER JOIN category AS c
			ON fc.category_id=c.category_id;
            
-- condicion, sacar la correspondencia con la categoria horror


SELECT a.actor_id 
    FROM film_actor 
		JOIN film_category 
			ON film_actor.film_id = film_category.film_id
		JOIN category 
			ON film_category.category_id = category.category_id
    WHERE category.name = 'Horror';



-- query final 

SELECT c.name AS categoria,
    a.first_name AS nombre_actor,
    a.last_name AS apellido_actor
    
FROM actor AS a
		INNER JOIN film_actor AS fa 
			ON a.actor_id = fa.actor_id
		INNER JOIN film_category AS fc 
			ON fa.film_id = fc.film_id
		INNER JOIN category AS c 
			ON fc.category_id = c.category_id
WHERE a.actor_id not IN ( -- ponemos la condicion

					-- unimos film_actor, que lo uno por actor_id para sacar nombres y apellido con category
                    -- como es una sub-consulta utilizo el 1en todos los alias
					SELECT fa1.actor_id
							FROM film_actor AS fa1 -- de film actor a film category , film_id
								INNER JOIN film_category AS fc1
									ON fa1.film_id = fc1.film_id
								INNER JOIN category AS c1  -- de film_category a category, category_id
									ON fc1.category_id = c1.category_id
					WHERE c1.name = 'Horror' -- c1=categori de la subconsulta
				)
ORDER BY a.last_name, a.first_name;


/*EJERCICIO 24
*/
