use petshop;

# ---------------------------------------------------------------------------
# creacion de trigger
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# creacion de trigger para actualizar el estado de las ordenes 
# ---------------------------------------------------------------------------

drop trigger if exists `t_actualizacion_estado_orden`;

delimiter //

create trigger `t_actualizacion_estado_orden`
after update on `pagos`
for each row 
begin
	if OLD.estado <> NEW.estado then
		if NEW.estado = 'pagado' then
			update ordenes 
            set estado = 'pagada'
            where num_pago = NEW.num_pago;
		end if;

		if NEW.estado = 'fallido' then
			update ordenes 
            set estado = 'cancelada'
            where num_pago = NEW.num_pago;
		end if;
	end if;
end //
delimiter ;

# ---------------------------------------------------------------------------
# creacion de trigger para el control del precio de los productos
# ---------------------------------------------------------------------------

drop trigger if exists `t_control_precio_producto`;

delimiter //

create trigger `t_control_precio_producto`
after update on `productos`
for each row 
begin
	if OLD.precio <> NEW.precio then
		insert into control_precio_de_productos values (OLD.id, NEW.precio, OLD.precio, current_timestamp);
	end if;
end //
delimiter ;

# ---------------------------------------------------------------------------
# creacion de trigger para control de stock de los productos
# ---------------------------------------------------------------------------

drop trigger if exists `t_control_stock_producto`;

delimiter //

create trigger `t_control_stock_producto`
after update on `productos`
for each row 
begin
	if OLD.stock <> NEW.stock then
		insert into control_stock_de_productos values (OLD.id, NEW.stock, OLD.stock, current_timestamp);
	end if;
end //
delimiter ;
