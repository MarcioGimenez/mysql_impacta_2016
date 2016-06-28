use sp;

delimiter $$
drop procedure saudacao$$
create procedure saudacao(in hora time)
        begin
                if(hora between '18:00:00' and '23:59:59')then -- nota >= 7 and nota <= 10
                        select 'Boa Noite';
                 elseif(hora >= '12:00:00' and hora < '18:00:00')then
                        select 'Boa Tarde';
                 elseif(hora >= '06:00:00' and hora < '12:00:00')then
                        select 'Bom dia';
                 elseif(hora >= '00:00:00' and hora < '06:00:00')then
                        select 'Vai Dormir';
                 else
                        select 'Valor Invalido';                 
                end if;
        end
$$
delimiter ;

call saudacao('21:00:00');
call saudacao('05:00:00');
call saudacao('15:00:00');
call saudacao('07:00:00');
call saudacao('29:00:00');