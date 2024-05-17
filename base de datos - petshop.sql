
create schema if not exists petshop;
use petshop;

# ---------------------------------------------------------------------------
# creacion de tablas
# ---------------------------------------------------------------------------

drop table if exists tipo_de_mascotas;
create table tipo_de_mascotas(
	id int auto_increment primary key,
    nombre varchar (255) not null
);

drop table if exists tipo_de_productos;
create table tipo_de_productos(
	id int auto_increment primary key,
    nombre varchar (255) not null
);

drop table if exists productos;
create table productos(
	id int auto_increment primary key,
    id_tipo_mascota int not null,
    id_tipo_producto int not null,
    nombre varchar (255) not null,
    imagen varchar (255) not null,
    precio decimal not null, 
    stock int not null default 0,
    fecha_alta datetime,
    fecha_baja datetime default null,
    constraint `fk_productos_id_tipo_mascota` foreign key (id_tipo_mascota) references tipo_de_mascotas (id),
	constraint `fk_productos_id_tipo_producto` foreign key (id_tipo_producto) references tipo_de_productos (id)
);

drop table if exists clientes;
create table clientes(
	dni int auto_increment primary key,
    mail varchar (255) not null,
    nombre varchar (255) not null,
    apellido varchar (255) not null,
    fecha_alta datetime,
    fecha_baja datetime default null
);
 
drop table if exists pagos;
create table pagos(
	num_pago int auto_increment primary key,
    total decimal not null,
    estado varchar (255) not null,
    fecha_alta datetime
);
 
drop table if exists ordenes;
create table ordenes(
	id int auto_increment primary key,
    dni_cliente int not null,
    num_pago int default null,
    estado varchar (255) not null,
    fecha_alta datetime,
     constraint `fk_ordenes_dni_cliente` foreign key (dni_cliente) references clientes (dni),
     constraint `fk_ordenes_num_pago` foreign key (num_pago) references pagos (num_pago)
);

drop table if exists orden_productos;
create table orden_productos(
    id_orden int not null,
    id_producto int not null,
    cantidad int not null default 1, 
    precio decimal not null,
    primary key (id_orden,id_producto),
    constraint `fk_orden_productos_id_orden` foreign key (id_orden) references ordenes (id),
    constraint `fk_orden_productos_id_producto` foreign key (id_producto) references productos (id)
);

# ---------------------------------------------------------------------------
# insercion de datos base
# ---------------------------------------------------------------------------
 
insert into tipo_de_mascotas (id,nombre) values
	(1,"perro"),
    (2,"gato");
    
    insert into tipo_de_productos (id,nombre) values
    (1,"alimento"),
    (2,"juguetes"),
    (3,"ropa"),
    (4,"pipeta"),
    (5,"camas");
    
    
