use db_cds;

show tables;

select * from cliente;

create view v_Cliente as
        select nome_cli as 'Cliente',
                  end_cli as 'Endereço',
                  
                  case sexo_cli
                        when 'm' then 'Masculino'
                        when 'f' then 'Feminino'
                  end      
                  as 'Sexo',
                  
                  nome_cid as 'Cidade',
                  nome_est as 'Estado'
                  
                  from cliente c
                  join cidade ci on c.cod_cid = ci.cod_cid
                  join estado e on ci.sigla_est = e.sigla_est;
                  
 select * from v_Cliente;
 
 select Cliente,Sexo from v_Cliente;
 
select Cliente,Sexo from v_Cliente where Sexo = 'Masculino';
 
 show create view v_Cliente;
 
 -- alterando views
 alter view v_Cliente as
                select nome_cli as 'Cliente',
                  end_cli as 'Endereco',
                  renda_cli as 'Renda',
                  
                  case sexo_cli
                        when 'm' then 'Masculino'
                        when 'f' then 'Feminino'
                  end      
                  as 'Sexo',
                  
                  nome_cid as 'Cidade',
                  nome_est as 'Estado'
                  
                  from cliente c
                  join cidade ci on c.cod_cid = ci.cod_cid
                  join estado e on ci.sigla_est = e.sigla_est;
 
 select * from v_Cliente;
 select Endereco as 'Endereço' from v_Cliente;
 
 -- apagando a View
 drop view v_Cliente;
 
 show databases;
 use information_schema;
 show tables;
 select * from views;
 

 
 