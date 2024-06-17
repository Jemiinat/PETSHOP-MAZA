use petshop;

# ---------------------------------------------------------------------------
# creacion de stored prosedures
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# sp para crear un producto
# ---------------------------------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_crear_producto`(
	in id_tipo_mascota int, 
    in id_tipo_producto int, 
    in nombre varchar (255), 
    in imagen varchar (255), 
    in precio decimal, 
    in stock int
)
BEGIN
	insert into productos values (null, id_tipo_mascota, id_tipo_producto, nombre, imagen, precio, stock, current_timestamp(), null);
	select *
	from productos
	order by id desc
	limit 1;
END$$
DELIMITER ;


# ---------------------------------------------------------------------------
# sp para modificar stock de producto
# ---------------------------------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_stock_de_producto`(in id_producto int, in p_stock int)
BEGIN 
	declare stock_de_producto int;

	select stock
	from productos
	where id = id_producto
	into stock_de_producto;

	set @nuevo_stock = stock_de_producto + p_stock;

	if @nuevo_stock < 0 then 
		set @nuevo_stock = 0;
	end if;

	update productos 
	set stock = @nuevo_stock 
	where id = id_producto;

	select *
	from productos
	where id = id_producto;
END$$
DELIMITER ;


# ---------------------------------------------------------------------------
# sp para obtener clientes ordenados
# ---------------------------------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_clientes_ordenados`(in campo varchar (60))
BEGIN
	if campo <> '' then 
		set @order = concat ('order by ', campo);
	else 
		set @order = '';
	end if; 
	set @clausula = concat ('select * from clientes ', @order);
	prepare runsql from @clausula;
	execute runsql;
	deallocate prepare runsql;
END$$
DELIMITER ;
