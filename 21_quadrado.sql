-- parametros in 
use sp;

drop procedure if exists sp_quadrado;

delimiter $$
create procedure sp_quadrado(in valor int)
            begin
                declare resultado int;
                set resultado = valor* valor;
                select resultado;
            end
$$
delimiter ;
call sp_quadrado(5);
call sp_quadrado(7);