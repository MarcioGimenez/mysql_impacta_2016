use db_cds;
desc artista;
select * from artista;

create or replace view v_mostra_artista as
        select  cod_art as 'cod',
                    nome_art as 'nome'
                    from artista
                    where cod_art >4;
                    
select * from v_mostra_artista;                  
-- views atualizaveis
-- nao sao atualizaveis view com distinct, union , 
-- all, case, subquery e agregação(max, min,...)

insert v_mostra_artista values(8,'muse'),(9,'New Order'),(10,'ACDC');

update v_mostra_artista set nome='Bowie' where cod=8;
update v_mostra_artista set nome='Anita' where cod=2;-- nao passa no filtro da consulta que compoe a view

delete from v_mostra_artista where cod=8;

-- nao passa no filtro da consulta que compoe a view
delete from v_mostra_artista where cod=3;