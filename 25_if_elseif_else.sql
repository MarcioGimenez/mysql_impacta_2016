use sp;

delimiter $$
create procedure resultado2(in nota decimal(10,2))
        begin
                if(nota between 7 and 10)then -- nota >= 7 and nota <= 10
                        select 'Parabens aprovado';
                 else if(nota >= 5 and nota < 7)then
                        select 'Recuperação';
                        
                 else if(nota >= 0 and nota < 5)then
                        select 'Reprovado';
                 else       
                        select 'Valor Invalido';                 
                end if;
        end
$$
delimiter ;

call resultado(8);
call resultado(5);