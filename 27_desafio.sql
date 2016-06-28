use db_cds;
desc funcionario;
desc dependente;

delimiter $$
create procedure sp_insert_func(in func varchar(100), in dep varchar(100))
        begin
                declare id int;
                if(func <> '' and func is not null)then
                        if not exists(select * from funcionario where nome_func = func)then
                                insert funcionario values(null,func,'rua a',10,'m');
                                set id = last_insert_id();
                                -- set id = (select max(cod_func) from funcionario);
                        else
                                set id = (select cod_func from funcionario where nome_func = func);
                        end if;
                        if(dep <>'' and dep is not null)then
                                insert dependente values(null,id,dep,'m');
                        end if;
                end if;
        end
$$
delimiter ;

call sp_insert_func('Tomas a',null);
call sp_insert_func('Tomas a','azul');
call sp_insert_func('Tomas b','amarelo');
select * from funcionario;
select * from dependente;