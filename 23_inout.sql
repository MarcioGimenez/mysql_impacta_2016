-- parametros inout - se TODOS os parametros de um sp for INOUT 
-- ela será DETERMINISC do contrário será NOT DETERMINISTIC
use sp;

drop procedure if exists sp_quadrado3;

delimiter $$
create procedure sp_quadrado3(inout valor int)
            begin
                set valor = valor* valor;
            end
$$
delimiter ;
set @a = 3;
call sp_quadrado3(@a);
select @a;
set @b= 33;
call sp_quadrado3(@b);
select @b;
