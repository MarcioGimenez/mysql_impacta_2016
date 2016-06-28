use db_cds;

start transaction;

delete from titulo_pedido;

rollback;
commit;

select * from titulo_pedido;
