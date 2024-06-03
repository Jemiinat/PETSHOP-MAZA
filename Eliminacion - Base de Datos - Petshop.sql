# ---------------------------------------------------------------------------
# eliminacion de tablas
# ---------------------------------------------------------------------------

drop table if exists petshop.orden_productos;
drop table if exists petshop.ordenes;
drop table if exists petshop.productos;
drop table if exists petshop.tipo_de_mascotas;
drop table if exists petshop.tipo_de_productos;
drop table if exists petshop.clientes;
drop table if exists petshop.pagos;

# ---------------------------------------------------------------------------
# eliminacion de esquema
# ---------------------------------------------------------------------------

drop schema if exists petshop;
