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


/*EJERICIO 8
Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación.
*/

SELECT title AS titulo,
		rating as clasificacion
FROM film
WHERE rating not in ('r','PG-13') -- pongo un in y asi me lo hago como lista y no como condiciones encadenadas con and o or

/*EJERICIO 3
*/









/*EJERICIO 3
*/