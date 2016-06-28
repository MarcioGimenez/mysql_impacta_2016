create database sp;
use sp;
create procedure sp_saudacao()
        select 'Olá Mundo!!!!!!!!' as 'Bobão'
;

call sp_saudacao();

drop procedure sp_saudacao;

-- #############################################
/*
Procedure contem uma consulta à uma tabela de outro banco de dados
*/
create procedure sp_consulta()
        select * from db_cds.artista;
;
call sp_consulta();

-- #######################################################
/*
um outro banco de dados chamando esta procedure
*/
use db_cds;
call sp.sp_saudacao();












