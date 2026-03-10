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

/*EJERICIO 3
Encuentra el título y la descripción de todas las películas que 
contengan la palabra "amazing" en su descripción.
*/

SELECT title AS Titulo, 
		description AS Descripcion 
FROM Film
WHERE description LIKE '% amazing %';-- al poner la palabra entre % nos aseguramos que la encuentre



/*EJERICIO 4
Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
*/
SELECT  title AS titulo,
		length AS duracion
FROM film
WHERE length >120;

/*EJERICIO 5
Recupera los nombres de todos los actores.
*/

SELECT   concat (first_name ,'  ' , last_name ) as nombre -- pongo comillas con espacio en blanco para que se vea nombre, espacio, apellido, quedando asi mas natural 
FROM actor;

/*EJERICIO 6
Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
*/

SELECT  first_name AS nombre,
		last_name AS apellido
FROM actor
WHERE last_name  LIKE '%GIBSON%'; -- con '%like%' encontramos la palabra que queremos buscar

/*EJERICIO 7
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



/*EJERICIO 8
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

/*EJERICIO 9
Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento.
*/

SELECT  rating AS clasificacion,
		COUNT(film_id) AS total_peliculas
FROM film
GROUP BY rating
ORDER BY total_peliculas DESC; -- ordeno de mayor a menor segun categoria


/*EJERICIO 10
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
	

/*EJERICIO 11
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

    
/*EJERICIO 12
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



/*EJERICIO 13
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
		

/*EJERICIO 14
Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción
*/

SELECT title
FROM film
WHERE description LIKE '%dog%' or description LIKE '%cat%';


/*EJERICIO 15
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

/*EJERICIO 16
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







/*EJERICIO 18
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

/*EJERICIO 19
Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la
tabla film.*/

SELECT title-- compruebo con,length as duraccion , rating as categoria
FROM film
WHERE rating ='R'AND length>120
ORDER BY length DESC;-- de la corta a la mas larga y compruebo condicion


/*EJERICIO 20
Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
muestra el nombre de la categoría junto con el promedio de duración.

*/

/*EJERICIO 3
*/