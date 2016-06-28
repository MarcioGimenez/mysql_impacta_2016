use test;
create table avaliacao(
                                    id int primary key auto_increment,
                                    nome varchar(50),
                                    nota int
                                );
                                
insert avaliacao values (null,'eva',3),(null,'ivo',7);   
select * from avaliacao;

-- ###############################################
-- view contendo uma consulta que faz filtro


create or replace view v_ava as
            select nome,nota from avaliacao where nota >=5
            -- sem o check option inseriu o registro do Ito
            with local check option -- local é default -> with check option
            ;

insert v_ava values('Ito',4),('ana',8);
insert v_ava values('Otto',4),('Avva',8);-- Otto nao passou no local check point
insert v_ava values('Itto',9),('anna',3);-- Anna nao passou no local check point

-- ####################################################
-- utilizando o cascaded

-- criar view a partir de outra view.
create or replace view v_ava2 as
        select * from v_ava where nota = 2  -- sem check option a nota 2 foi inserida
       -- with local check option -- com check option validou o where somente desta view 
         with cascaded check option;
insert v_ava2 values('eco',2);
insert v_ava2 values('Leo',2);
insert v_ava2 values('Lia',2);


