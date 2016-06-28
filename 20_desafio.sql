use sp;

create procedure formata_data(in agora date)
    select  date_format(agora,'%d/%m/%Y')
;
call formata_data('2002-03-16');
call formata_data(now());

-- ###############################################
drop procedure formata_cpf;
create procedure formata_cpf(in cpf char(11))
        select concat(
                                    left(cpf,3),'.',
                                    substring(cpf,4,3),'.',
                                    substring(cpf,7,3),'-',
                                    right(cpf,2)
                            ) as 'CPF'
;
call formata_cpf(25896314764);

-- ###############################################
drop procedure ultimo;
delimiter $$
create procedure ultimo(in nome varchar(255))
        begin
            declare reverso varchar(255);
            declare posicao int;
            
            set reverso = reverse(trim(nome));
            set posicao = locate(' ',reverso);
            
            select right(trim(nome),posicao-1);
        end
$$

delimiter ;
call ultimo('Maria Aparecida');
call ultimo('Maria Aparecida das Dores');
call ultimo('Maria Aparecida das Dores nas Costas');

-- #########################################
use db_cds;
drop procedure sp_categoria;
delimiter $$
create procedure sp_categoria(in cat varchar(50))
        begin
                declare cod int;
                set cod = (select max(cod_cat) from categoria);
                -- select max(cod_cat) from categoria into cod
                -- select max(cod_cat) into cod from categoria -- problema de versao
                set cod = cod + 1;
                insert categoria values(cod,cat);
        end
$$
delimiter ;
call sp_categoria('Valsa');
select * from categoria;
call sp_categoria('Axé');

-- ##############################################
delimiter $$
drop procedure atualiza $$
create procedure atualiza(in func int, in aum decimal(10,2))
        begin
                set aum = 1+(aum/100);
                update funcionario set sal_func = sal_func * aum where cod_func = func;
        end
$$
delimiter ;
select * from funcionario;
call atualiza(2,20);
