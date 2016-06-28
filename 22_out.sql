-- parametros in e parametros out
use sp;

drop procedure if exists sp_quadrado2;

delimiter $$
create procedure sp_quadrado2(in valor int,out saida int)
            begin
                
                set saida = valor* valor;
                
            end
$$
delimiter ;
call sp_quadrado2(5,@retorno);
call sp_quadrado2(7,@retorno);
select @retorno;

select @retorno + 50;