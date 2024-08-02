# Midterm de Bases de Datos --> Tienda de instrumentos musicales

# El Projecto
Este proyecto trata una base de datos de una tienda de instrumentos musicales.
Se crea una base de datos con algunas tablas con sus valores y sus relaciones respectivas.
Se realizan una serie de búsquedas y consultas sobre la misma base de datos que nos requiere el ejercicio.
La parte Bonus d ejercicio consta de la parte frontend y la parte backend en la cual conectamos la base se datos que nos permiten realizar opraciones CRUD

# Nuestra Base de datos
Tienda de instrumentos musicales

# La tablas
- **Proveedores**: Almacenamos la información de los proveedores de los instrumentos musicales.
- **Instrumentos**: Almacenamos la información de los instrumentos en el cual incluimos el proveedor o las marcas.
- **Ventas**: Registro de las ventas, fechas, etc.
- **Detalles_Ventas**: Se detallan los productos  que se incluyen en cada venta.
- **Cientes**: Almacenamos los datos clave de los clientes
- **Clientes_Ventas_Favoritas**: Asociamos los clientes con sus ventas favoritas utilizando la relación uno a uno.

Hemos insertado todos los datos correspondientes a cada una de las tablas.

Muestra de tabla:

![Tabla_Instrumentos](./instrument_table.jpeg)

# El  diagrama de la BBDD:

![Diagrama](./shop_instruments.png)

# Búsquedas y consultas

- Se realizan 10 tipos de búsquedas simples
- Se realizan  10 tipos de búsquedas complejas

# Triggers
- Se crean dos triggers dentro de la base de datos.

# Transacciones
- Se incluye una  una transacción que incluya varias operaciones de manipulación de datos.

# Funciones
- Se crean  3 funciones definidas por el usuario y las hemos utilizado en las operaciones de la base de datos