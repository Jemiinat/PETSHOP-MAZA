
use petshop;

# ---------------------------------------------------------------------------
# insercion de datos base
# ---------------------------------------------------------------------------
 
insert into tipo_de_mascotas (id,nombre) values
	(1, "perro"),
    (2, "gato");
    
insert into tipo_de_productos (id,nombre) values
    (1,"alimento"),
    (2,"juguetes"),
    (3,"ropa"),
    (4,"pipeta"),
    (5,"camas");
    
insert into productos (id, id_tipo_mascota,id_tipo_producto, nombre, imagen, precio, stock, fecha_alta) values
	(1, 1, 1, "croquetas de pollo", "imagen del producto 1", 15000, 10, now()),
    (2, 1, 2, "pelota","imagen del producto 2", 500, 5, now()),
    (3, 1, 3, "buzo con capucha", "imagen del producto 3", 4000, 2, now()),
    (4, 1, 4, "antipulgas", "imagen del producto 4", 2100, 7, now()), 
    (5, 1, 5, "cama mediana", "imagen del producto 5", 7500, 3, now()),
    (6, 2, 1, "croquetas de pescado", "imagen del producto 1", 15000, 10, now()),
    (7, 2, 2, "plumerito","imagen del producto 2", 500, 5, now()),
    (8, 2, 3, "chaleco", "imagen del producto 3", 4000, 2, now()),
    (9, 2, 4, "antipulgas", "imagen del producto 4", 2100, 7, now()), 
    (10, 2, 5, "cama chica", "imagen del producto 5", 7500, 3, now());
    
insert into clientes (dni,mail,nombre,apellido,fecha_alta) values
	(12345678,"juanantonio@gmail.com","juan antonio", "molina", now()),
	(23456789,"carolina90@gmail.com","carolina", "roncaglia", now()),
	(98765432,"nam@gmail.com", "alfredo", "perez", now()),
	(23456987, "natalia65@gmail.com", "natalia", "juarez", now()),
	(33556786, "gdr123@gmail.com", "gerardo", "benites", now());
    
insert into pagos (num_pago, total, estado, fecha_alta) values
	(1, 7500, "pagado", now()),
	(2,4000, "fallido", now());

insert into ordenes (id, dni_cliente, num_pago, estado, fecha_alta) values
	(1, 12345678, 1, "pagado", now()),
	(2, 33556786, 2, "fallido", now());

insert into orden_productos (id_orden, id_producto, cantidad, precio) values
	(1, 5, 1, 7500),
	(2, 8, 1, 4000);
