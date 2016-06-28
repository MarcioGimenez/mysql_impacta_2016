use db_cds;

set @artista = (select * from artista);-- erro - matriz
select @artista;

set @artista = (select * from artista where cod_art = 1);-- erro - vetor
select @artista;


-- ####################################################
-- 1forma
set @artista = (select nome_art from artista where cod_art = 1);
select @artista; 

-- ####################################################
-- 2ª forma
select nome_art  from artista where cod_art = 1 into @artista2;
select @artista2; 

-- ####################################################
-- 3ª forma
select nome_art , cod_art  into @artista3, @codigo from artista where cod_art = 1 ;
select concat(@artista3, ' - ' ,@codigo); 

select version();
