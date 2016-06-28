set @x = 'Carregador de Celular';
select @x;
select @x;

create procedure sp_sau()
    select @x;
;
call sp_sau();
set @x = 'Bethania';