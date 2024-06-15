use petshop;

# ---------------------------------------------------------------------------
# creacion de vistas
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# vista de listado de clientes
# ---------------------------------------------------------------------------

create or replace view v_clientes AS 
select * 
from clientes;


# ---------------------------------------------------------------------------
# vista para listar clientes con mas de un nombre
# ---------------------------------------------------------------------------

create or replace view v_clientes_con_mas_de_un_nombre as 
	(select * 
    from clientes 
    where nombre like '% %');
    

# ---------------------------------------------------------------------------
# vista para listar clientes ordenados descendentes
# ---------------------------------------------------------------------------

create or replace view v_clientes_ordenados_descendentes as
	(select *
	from clientes 
    order by fecha_alta desc);
    
    
