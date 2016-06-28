use db_cds;

desc artista;
select * from artista;


drop procedure sp_insert_artista;

-- para ter mais do que uma instrução terei de separa-las com o ';'
-- portanto definirei outro delimitador para o script
delimiter |

create procedure sp_insert_artista(in codigo int(11),in artista varchar(100))   
        begin   
            insert db_cds.artista values(codigo,artista);
            select * from db_cds.artista where db_cds.artista.cod_art = codigo;
        end
|        
call sp_insert_artista(13,'Anita')|

delimiter ;
call sp_insert_artista(14,'Carla Perez');