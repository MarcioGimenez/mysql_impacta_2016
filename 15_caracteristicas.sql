use sp;

delimiter $$

create procedure teste()
        -- caracteristicas da SP
        -- LANGUAGE SQL
        -- CONTAINS SQL
        -- NO SQL
        -- PAG 42
        NO SQL
        begin
                select 'I de Iscola ';
                select 'by Carla Peres';
        end
$$

call teste()$$
delimiter ;

select * from information_schema.routines; 
select * from information_schema.routines where routine_schema = 'sp'; 
select routine_definition from information_schema.routines where routine_schema = 'sp'; 

alter procedure teste LANGUAGE SQL;
-- não pode alterar o corpo da porcedure
-- nem os seus argumentos/parametros
-- somente suas caracteristicas podem ser alteradas.

-- para alterar parametros oi corpo devemos apagar a procedure e 
-- cria-la novamente.

drop procedure if exists teste;



