use db_cds;

desc artista;
select * from artista;


create procedure sp_insert_artista(in codigo int(11),in artista varchar(100))
        select codigo , artista
;

call sp_insert_artista(25,'Joelma');

call sp_insert_artista(27,'Gretchen');


