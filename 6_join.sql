use db_cds;

select  * 
            from cliente cli
            join conjuge cj on cli.cod_cli = cj.cod_cli;
            
desc cliente;
desc conjuge;

create view v_altera as 
    select   cli.cod_cli as 'codigo',
                nome_cli as 'nome',
                cj.cod_cli as 'codigo2',
                nome_conj as 'Conjuge'
                from cliente cli
                join conjuge cj on cli.cod_cli = cj.cod_cli;
            
 select * from v_altera;
 
 -- nao modifica duas tabelas ao mesmo tempo
 update v_altera set nome='Joao Figueira',conjuge='Carlota Figueira'
                        where codigo = 1;
 
  update v_altera set nome='Joao Figueira'-- ,conjuge='Carlota Figueira'
                        where codigo = 1;
   update v_altera set conjuge='Carlota Figueira'-- ,nome='Joao Figueira'
                        where codigo = 1;
  
  -- POR PADRAO O MYSQL NAO FAZ ALTERAÇÕES EM REISTROS 
  -- QUE NAO CONTENHAM CHAVE PRIMARIA
  -- PARA MUDAR:
  set SQL_SAFE_UPDATES = 0;
  