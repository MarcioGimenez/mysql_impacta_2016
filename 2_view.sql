-- todos os funcionarios e seus dependentes se tiver

use db_cds;
create or replace view V_func_dep as
    select  nome_func as 'Funcionario',
                
                group_concat(
                        case  
                            when nome_dep is null then '-- xxx --'
                            when nome_dep is not null then nome_dep
                        end 
                )
                as 'Dependente'
        
                from funcionario f
                left join dependente d on f.cod_func = d.cod_func
                group by nome_func;
                
  select * from   V_func_dep;
                
/*
- nao existe view a partir de tabelas temporarias
- nao existe view temporaria - create temporary view...
- o identificador atribuido a uma view NAO PODE 
ser igual ao nome de uma tabela, indice ou chave
-- trigger nao pode ser atribuido a uma view
*/    
use db_cds;
 select * from pedido;               