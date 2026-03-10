EXAMEN SQL, SARA GUZMÁN LÓPEZ.

📝 Descripción

Este repositorio contiene la resolución detallada del examen de SQL basado en la base de datos Sakila. El objetivo es demostrar habilidades en la construcción de consultas complejas, uso de subconsultas, optimización de JOINS y manejo de funciones de agregación.

📊 Modelo de Datos

El proyecto esta basado en un sistema de gestión de base de datos  de un Video Club en el que se hacen cosultas a los datos, los datos son variados desde datos técnicos de las peliculas y datos personales de los actores hasta la fecha de alquiler y recogida de las cintas de video

🚀 Tecnologías Utilizadas
Lenguaje: SQL (MySQL / visual estudio)

Herramienta: MySQL Workbench /Visual  Studio

Base de Datos: Sakila Sample Database

🔍 Ejercicios Destacados

1. Filtrado Avanzado con Subconsultas

Como ejercicio 23 con subconsulta de nombre de actores que no han participado en la películas de la categoría 'horror' o ejercicio 22 , titulo de películas que se alquilaron por más de 5 dias

Concepto clave: Uso de NOT IN y Subconsultas para exclusión lógica, funciones agregadas como  DATEDIFF

Dificultad: Media-Alta.

Concepto clave: Uso de INNER JOIN para conectar film ↔ film_category ↔ category.

🛠️ Cómo Ejecutar las Consultas
Descarga el archivo .sql de este repositorio.

Asegúrate de tener instalada la base de datos Sakila.

Ejecuta el script en tu gestor de base de datos preferido.

SQL
-- Ejemplo de ejecución rápida
SOURCE examen_sakila.sql;


💡 Buenas Prácticas Aplicadas
Para este examen, he seguido los siguientes estándares:

Alias Claros: Uso de alias descriptivos para tablas (actor AS a) y columnas (AS total_ventas).

Indentación: Código formateado para facilitar la lectura y el mantenimiento.

Mayúsculas en Reservadas: Todas las palabras reservadas de SQL (SELECT, FROM, WHERE) están en mayúsculas para diferenciar la sintaxis de los datos.

👤 Autor
Sara Guzmán López- 
https://github.com/saraguzmanlopez-ops

Estudiante de  Análisis de Datos & IA


ejemplo funciones querys avanzadas con LIKE
(image.png)

ejemplo busqueda varias tablas relacionadas con funciones agregadas 
(image-1.png)

Ejemplo de busqueda de mejora continua en el aprendizaje y querer poner metas superiores además de lo que pide el examen, en los ejercicios 15 hay un apartado BIS en el que no solo enseño la tabla vacia por lo que se entiende que hay "0" sino que en el ejercicio 15 BIS hago la tabla con el "0" visto!
(image-3.png)



Intentando la mejora y demostrar mis habilidades , en el ejercicio 17 BIS muestro  la tabla con el numero de películas en la categoria 'family'(image-2.png)