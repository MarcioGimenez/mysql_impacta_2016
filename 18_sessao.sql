use sp;
-- escopo global
set @nome = 'Mané';
set @idade = 55;

delimiter $$

create procedure ola(in curso varchar(10))-- curso é uma variavel e receberá o paramtro passado pelo usuario na chamada da procedure
        begin
                declare nome varchar(40);-- declaração de variavel dentro da procedure
                set nome = 'Edu'; -- escopo local, assim como curso
                
                set @escola = 'Impacta';
                
                select concat(nome,' - ',@nome,' - ',curso,' - ',@escola,' - ',@idade );
        end
$$

select @nome$$
select @idade$$
select @escola$$
call ola('PHP')$$
select @escola$$