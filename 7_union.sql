-- BLOCO QUE TRAGA TODOS OS PEDIDOS 
-- TODOS OS FUNCIONARIOS E OS FUNCIONARIOS QUE NUNCA FIZERAM UM PEDIDO
-- JUNTE OS DEPENDENTES SE TIVER
-- TODOS OS CLIENTES TENDO FEITO PEDIDO OU NAO
-- E OS CONJUGES CASO SEJA CASADO     

-- ###########################################################
-- CLIENTES SOLTEIROS
SELECT * FROM CLIENTE L
               LEFT  JOIN CONJUGE C ON L.COD_CLI = C.COD_CLI
               WHERE C.COD_CLI IS NULL;

SELECT * FROM CLIENTE WHERE COD_CLI NOT IN(select cod_cli from conjuge);

-- ##########################################################
select * from pedido;
delete from pedido where num_ped in(11,12,13);

create or replace view v_tudo as
    select  num_ped as 'Pedido',
            nome_func as 'Funcionario',
            nome_dep as 'Dependente',
            nome_cli as 'Cliente',
            nome_conj as 'Conjuge'
            from pedido p 
            
            right join funcionario f on p.cod_func = f.cod_func
            left join dependente d on f.cod_func = d.cod_func
            
            right join cliente c on p.cod_cli = c.cod_cli
            left join conjuge cj on c.cod_cli = cj.cod_cli
  union  -- all 
 select  num_ped as 'Pedidofddfdf',
            nome_func as 'Funcionariodfdf',
            nome_dep as 'Dependentefddf',
            nome_cli as 'Clientedfdf',
            nome_conj as 'Conjugedfdf'
            
            from pedido p 
            
            right join funcionario f on p.cod_func = f.cod_func
            left join dependente d on f.cod_func = d.cod_func 
            
            left join cliente c on p.cod_cli = c.cod_cli
            left join conjuge cj on c.cod_cli = cj.cod_cli
            
            order by Pedido
            ;
            
 select * from v_tudo 
                where Dependente is null 
                and conjuge is null
                and Pedido is not null;           
            