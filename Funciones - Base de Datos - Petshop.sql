use petshop;

# ---------------------------------------------------------------------------
# creacion de funciones
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# funcion para obtener el total de ordenes pagadas
# ---------------------------------------------------------------------------

DROP FUNCTION `f_obtener_total_de_ordenes_pagadas`;

DELIMITER $$
CREATE FUNCTION `f_obtener_total_de_ordenes_pagadas`() RETURNS int
    NO SQL
BEGIN
	declare total_de_ordenes int;

    select count(*)  
    from ordenes
    where estado = 'pagado'
    into total_de_ordenes;
    
	RETURN total_de_ordenes;
END$$
DELIMITER ;

# ---------------------------------------------------------------------------
# funcion para obtener mail de cliente por dni
# ---------------------------------------------------------------------------

DROP FUNCTION `f_obtener_mail_de_cliente_por_dni`;

DELIMITER $$
CREATE FUNCTION `f_obtener_mail_de_cliente_por_dni`(dni_cliente int) RETURNS varchar(255) CHARSET utf8mb4
    NO SQL
BEGIN
declare mail_de_cliente varchar (255);

select mail
from clientes
where dni = dni_cliente
into mail_de_cliente;

RETURN mail_de_cliente;
END$$
DELIMITER ;

# ---------------------------------------------------------------------------
# funcion para obtener el cliente mas nuevo 
# ---------------------------------------------------------------------------

DROP FUNCTION `f_obtener_nombre_de_cliente_mas_nuevo`;

DELIMITER $$
CREATE FUNCTION `f_obtener_nombre_de_cliente_mas_nuevo`() RETURNS varchar(255) CHARSET utf8mb4
    NO SQL
BEGIN
declare nombre_de_cliente varchar (255);

select nombre
from clientes
order by fecha_alta desc limit 1
into nombre_de_cliente;

RETURN nombre_de_cliente;
END$$
DELIMITER ;
