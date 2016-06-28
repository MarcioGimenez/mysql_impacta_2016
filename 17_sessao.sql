use sp;

set @codigo = 4;

create procedure consulta()
    select * from db_cds.cliente where cod_cli = @codigo
;