-- retorne o pedido de maior valor
insert pedido values (11,3,2,'2016-01-09',3000,'s'),
                                (12,2,3,'2016-02-10',2000,'s'),
                                (13,1,4,'2016-02-15',1500,'s');
                                
-- POG
select * from pedido order by val_ped desc limit 2;

-- correta
select max(val_ped) from pedido; -- maior valor
select * from pedido where val_ped = 3000;
                                
select * from pedido where val_ped = (select max(val_ped) from pedido);     



-- ##############################################
-- que retorne os 5 produtos mais caros
-- os produtos que tenham os 5 maiores valores

select distinct val_ped from pedido order by val_ped desc limit 5;
select * from pedido where val_ped in( 3000,2000,1500,300,200);

-- seria o corereto porem esta versao do Mysql não suporta limit em subquery
select * from pedido where val_ped in
                (select distinct val_ped from pedido order by val_ped desc limit 5);
 
 -- resolvendo o problema:
 -- 1 criar uma view com a consulat que irá na subquery
 create view cinco_valores as
    select distinct val_ped from pedido order by val_ped desc limit 5;
 -- 2 chamar essa view na subquery   
 select * from pedido where val_ped in
                            (select * from cinco_valores);   