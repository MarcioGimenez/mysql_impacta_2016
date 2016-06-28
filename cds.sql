
-- drop database db_cds;
create database db_cds;

use db_cds;


-- tabela artista
create table artista (
	cod_art		int				not null auto_increment,
	nome_art	varchar(100)	not null,

constraint pk_art primary key (cod_art),
constraint uq_art unique(nome_art)
);



-- tabela gravadora
create table gravadora (
cod_grav	int			not null auto_increment,
nome_grav	varchar(50)	not null,

constraint pk_grav primary key (cod_grav),
constraint uq_grav unique (nome_grav)
);


-- tabela categoria
create table categoria(
cod_cat		int			not null auto_increment,
nome_cat	varchar(50)	not null,

constraint pk_cat
primary key (cod_cat),
constraint uq_cat unique (nome_cat)
) ;


-- tabela estado
create table estado (
sigla_est	char(2)		not null,
nome_est	char(50)	not null,

constraint pk_est  primary key(sigla_est),
constraint uq_est  unique(nome_est)
) ;


-- tabela cidade
create table cidade (
cod_cid		int				not null auto_increment,
sigla_est	char(2)			not null,
nome_cid	varchar(100)	not null,

constraint pk_cid primary key (cod_cid),
constraint fk_cid foreign key (sigla_est) references estado (sigla_est)
);


-- tabela cliente
create table cliente (
cod_cli	int		not null auto_increment,
cod_cid	int		not null,
nome_cli	varchar(100)	not null,
end_cli	varchar(100)	not null,
renda_cli	decimal(10,2)	not null 	default 0,
sexo_cli	char(1)	not null 	default 'f',

constraint pk_cli
primary key (cod_cli),

constraint fk_cli
foreign key (cod_cid)
references cidade (cod_cid),

constraint ch_cli_1
check (renda_cli>=0),

constraint ch_cli_2
check(sexo_cli in ('f','m'))
);


-- tabela conjuge
create table conjuge
(
cod_cli	int		not null,
nome_conj	varchar(100)	not null,
renda_conj	decimal(10,2)	not null 	default 0,
sexo_conj	char(1)	not null 	default 'm',

constraint pk_conj
primary key (cod_cli),

constraint fk_conj
foreign key (cod_cli)
references cliente (cod_cli),

constraint ch_conj_1
check (renda_conj>=0),

constraint ch_conj_2
check(sexo_conj in ('f','m'))
);


-- tabela funcionario
create table funcionario
(
cod_func	int		not null auto_increment,
nome_func	varchar(100)	not null,
end_func	varchar(200)	not null,
sal_func	decimal(10,2)	not null 	default 0,
sexo_func	char(1)	not null 	default 'f' ,

constraint pk_func 
primary key (cod_func),

constraint ch_func_1 
check (sal_func>=0),

constraint ch_func_2
check(sexo_func in ('f','m'))
);

-- tabela dependente
create table dependente
(
cod_dep	int		not null auto_increment,
cod_func	int		not null,
nome_dep	varchar(100)	not null,
sexo_dep	char(1)	not null	 default 'm',

constraint pk_dep
primary key (cod_dep),

constraint fk_dep
foreign key (cod_func)
references funcionario (cod_func),

constraint ch_dep
check(sexo_dep in ('f','m'))
);


-- tabela titulo
create table titulo
(
cod_tit 	int           	not null auto_increment,
cod_cat  	int           	not null,
cod_grav 	int           	not null,
nome_cd   	varchar(100)	not null,
val_cd  	decimal(10,2)	not null,
qtd_estq 	int           	not null,

constraint pk_tit
primary key(cod_tit),

constraint uq_tit
unique(nome_cd),

constraint fk_tit_1
foreign key(cod_cat)
references categoria(cod_cat),

constraint fk_tit_2
foreign key(cod_grav)
references gravadora(cod_grav),

constraint ch_tit_1
check(val_cd>=0),

constraint ch_tit_2
check(qtd_estq>=0)
);


-- tabela pedido
create table pedido
(
num_ped 	int           		not null auto_increment,
cod_cli  	int           		not null,
cod_func 	int           		not null,
data_ped 	datetime	        not null,
val_ped  	decimal(10,2)		  null,
fim_ped   char(1)           not null default 'n',

constraint pk_ped
primary key(num_ped),

constraint fk_ped_1
foreign key(cod_cli)
references cliente(cod_cli),

constraint fk_ped_2
foreign key(cod_func)
references funcionario(cod_func),

constraint ch_ped
check(val_ped>0)
);


-- tabela titulo_pedido (detalhes do pedido)
create table titulo_pedido
(
num_ped	  int		        not null auto_increment,
cod_tit 	int 		      not null,
qtd_cd  	int		        not null,
val_cd    decimal(10,2)	not null,

constraint pk_titped    primary key(num_ped,cod_tit),
constraint fk_titped_4  foreign key(cod_tit)  references titulo(cod_tit),
constraint fk_titped_3  foreign key(num_ped) references pedido(num_ped),
constraint ch_titped_2  check(qtd_cd>=1),
constraint ch_titped_3  check(val_cd>=0) );



-- tabela titulo_artista (detalhes do titulo)
create table titulo_artista
(
cod_tit 	int 	not null,
cod_art 	int 	not null,

constraint pk_titart
primary key(cod_tit,cod_art),

constraint fk1_titart 
foreign key(cod_tit)
references titulo(cod_tit),

constraint fk2_titart
foreign key(cod_art) 
references artista(cod_art)
);

-- dados tabela artista
insert artista values(1,'marisa monte')
,(2,'gilberto gil')
,(3,'caetano veloso')
,(4,'milton nascimento')
,(5,'legião urbana')
,(6,'the beatles')
,(7,'rita lee');


-- dados tabela gravadora
insert gravadora values(1,'polygram')
,(2,'emi')
,(3,'som livre')
,(4,'sony music');


-- dados tabela categoria
insert categoria values(1,'mpb')
,(2,'trilha sonora')
,(3,'rock internacional')
,(4,'rock nacional');


-- dados tabela estado
insert estado values ('sp','são paulo')
, ('mg','minas gerais')
, ('rj','rio de janeiro');


-- dados tabela cidade
insert cidade values (1,'sp','são paulo')
,(2,'sp','sorocaba')
,(3,'sp','jundiaí')
,(4,'sp','americana')
,(5,'sp','araraquara')
,(6,'mg','ouro preto')
,(7,'rj','cachoeiro do itapemirim');


-- dados tabela cliente
insert cliente values(1,1,'josé nogueira','rua a',1500.00,'m')
,(2,1,'angelo pereira','rua b',2000.00,'m')
,(3,1,'além mar paranhos','rua c',1500.00,'f')
,(4,1,'catarina souza','rua d',892.00,'f')
,(5,1,'vagner costa','rua e',950.00,'m')
,(6,2,'antenor da costa','rua f',1582.00,'m')
,(7,2,'maria amélia de souza','rua g',1152.02,'f')
,(8,2,'paulo roberto da silva','rua h',3250.00,'m')
,(9,3,'fatima de souza','rua i',1632.00,'f')
,(10,3,'joel da rocha','rua j',2000,'m');


-- dados tabela conjuge
insert conjuge values (1,'carla nogueira',2500.00,'f')
,(2,'emilia pereira',5500.00,'f')
,(6,'altiva da costa',3000.00,'f')
,(7,'carlos de souza',3250.00,'m');


-- dados tabela funcionario
insert funcionario values(1,'vânia gabriela pereira','rua a',2500.00,'f')
,(2,'norberto pereira da silva','rua b',300.00,'m')
,(3,'olavo linhares','rua c',580.00,'m')
,(4,'paula da silva','rua d',3000.00,'f')
,(5,'rolando rocha','rua e',2000.00,'m');


-- dados tabela dependente
insert dependente values (1,1,'ana pereira','f')
,(2,1,'roberto pereira','m')
,(3,1,'celso pereira','m')
,(4,3,'brisa linhares','f')
,(5,3,'mari sol linhares','f')
,(6,4,'sonia da silva','f');


-- dados tabela titulo
insert titulo values(1,1,1,'tribalistas',30.00,1500)
,(2,1,2,'tropicália',50.00,500)
,(3,1,1,'aquele abraço',50.00,600)
,(4,1,2,'refazenda',60.00,1000)
,(5,1,3,'totalmente demais',50.00,2000)
,(6,1,3,'travessia',55.00,500)
,(7,1,2,'courage',30.00,200)
,(8,4,3,'legião urbana',20.00,100)
,(9,3,2,'the beatles',30.00,300)
,(10,4,1,'rita lee',30.00,500);


-- dados tabela pedido
insert pedido values(1,1,2,'2002/05/02',1500.00,'s')
,(2,3,4,'2002/05/02',50.00,'s')
,(3,4,5,'2002/06/02',100.00,'s')
,(4,1,4,'2003/03/02',200.00,'s')
,(5,7,5,'2003/03/02',300.00,'s')
,(6,4,4,'2003/03/02',100.00,'s')
,(7,5,5,'2003/03/02',50.00,'s')
,(8,8,2,'2003/03/02',50.00,'s')
,(9,2,2,'2003/03/02',2000.00,'s')
,(10,7,1,'2003/03/02',3000.00,'s');


-- dados tabela artista_titulo
insert titulo_artista values(1,1),
(2,2),
(3,2),
(4,2),
(5,3),
(6,4),
(7,4),
(8,5),
(9,6),
(10,7);


-- dados tabela titulo_pedido
insert titulo_pedido values(1,1,2,30.00)
,(1,2,3,20.00)
,(2,1,1,50.00)
,(2,2,3,30.00)
,(3,1,2,40.00)
,(4,2,3,20.00)
,(5,1,2,25.00)
,(6,2,3,30.00)
,(6,3,1,35.00)
,(7,4,2,55.00)
,(8,1,4,60.00)
,(9,2,3,15.00)
,(10,7,2,15.00);




SELECT * FROM ARTISTA;
SELECT * FROM GRAVADORA;
SELECT * FROM CATEGORIA;
SELECT * FROM ESTADO;
SELECT * FROM CIDADE;
SELECT * FROM CLIENTE;
SELECT * FROM CONJUGE;
SELECT * FROM FUNCIONARIO;
SELECT * FROM DEPENDENTE;
SELECT * FROM TITULO;
SELECT * FROM PEDIDO;
SELECT * FROM TITULO_PEDIDO;
SELECT * FROM TITULO_ARTISTA;


