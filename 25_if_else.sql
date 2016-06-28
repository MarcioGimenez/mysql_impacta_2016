use sp;

delimiter $$
create procedure agrado(in nota decimal(10,2))
        begin
                if(nota = 10)then
                        select 'Parabens vc tirou a nota maxima';
                end if;
        end
$$
delimiter ;

call agrado(10);
call agrado(5);