create database Exercicios;

use exercicios;

/*Criação da tabela "Times", o "id" de times vai ser a chave primária, 
e a tabela possui o nome dos times, "id" dos jogadores, "id" dos estádios, "id" dos paises,
"id" das cidades, "id" dos gols equivalente a cada equipe e o "id" dos titulos equivalente a cada equipe.*/
create table TIMES (
id_times int not null primary key,
nome_times varchar(25),
id_jogadores int not null,
id_estadios int not null,
id_pais int not null,
id_cidades int not null,
id_gols int not null,
id_titulos int not null );

/*Criação da tabela "Jogadores", o "id" de jogadores vai ser a chave primária, 
e a tabela possui o nome dos jogadores, a idade e o "id" dos times.*/
create table JOGADORES (
id_jogadores int not null primary key,
nome_jogadores varchar(25),
idade int not null,
id_times int not null);

/*Criação da tabela "Estadios", o "id" de estadios vai ser a chave primária, 
e a tabela possui o nome dos estádios, a capacidade, o "id" dos paises e o "id" das cidades.*/
create table ESTADIOS (
id_estadios int not null primary key,
nome_estadios varchar(100),
capacidade varchar(10) not null,
id_pais int not null,
id_cidade int not null);

/*Criação da tabela "Cidades", o "id" de cidades vai ser a chave primária, 
e a tabela possui o nome das cidades e o "id" dos paises.*/
create table CIDADES (
id_cidade int not null primary key,
nome_cidade varchar(25),
id_pais int not null);

/*Criação da tabela "Pais", o "id" de pais vai ser a chave primária, 
e a tabela possui o nome dos paises.*/
create table PAIS (
id_pais int not null primary key,
nome_pais varchar(25));

/*Criação da tabela "Gols", o "id" de gols vai ser a chave primária, 
e a tabela possui a quantidade de gols de cada time e o "id" dos times.*/
create table GOLS (
id_gols int not null primary key,
gols_totais varchar(3),
id_times int not null);

/*Criação da tabela "Titulos", o "id" de titulos vai ser a chave primária, 
e a tabela possui a quantidade de titulos de cada time e o "id" dos times.*/
create table TITULOS (
id_titulos int not null primary key,
titulos_totais varchar(3),
id_times int not null);

/*Constraint - Tabela de Times*/

/*Criação da constraint "FK_TIMES_JOGADORES" na tabela Times, que ira permitir
que a chave estrangeira "id_jogadores" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_JOGADORES 
foreign key(id_jogadores) references Times(id_times) on delete restrict;

/*Criação da constraint "FK_TIMES_ESTADIOS" na tabela Times, que ira permitir
que a chave estrangeira "id_estadios" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_ESTADIOS
foreign key(id_estadios) references Times(id_times) on delete restrict;

/*Criação da constraint "FK_TIMES_PAIS" na tabela Times, que ira permitir
que a chave estrangeira "id_pais" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_PAIS
foreign key(id_pais) references Times(id_times) on delete restrict;

/*Criação da constraint "FK_TIMES_CIDADES" na tabela Times, que ira permitir
que a chave estrangeira "id_cidade" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_CIDADES
foreign key(id_cidade) references Times(id_times) on delete restrict;

/*Criação da constraint "FK_TIMES_GOLS" na tabela Times, que ira permitir
que a chave estrangeira "id_gols" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_GOLS 
foreign key(id_gols) references Times(id_times) on delete restrict;

/*Criação da constraint "FK_TIMES_TITULOS" na tabela Times, que ira permitir
que a chave estrangeira "id_titulos" funcione de modo restrito.*/
alter table Times add constraint FK_TIMES_TITULOS 
foreign key(id_titulos) references Times(id_times) on delete restrict;

/*Constraint - Tabela de Jogadores*/

/*Criação da constraint "FK_JOGADORES_TIMES" na tabela Jogadores, que ira permitir
que a chave estrangeira "id_times" funcione de modo restrito.*/
alter table Jogadores add constraint FK_JOGADORES_TIMES 
foreign key(id_times) references Jogadores(id_jogadores) on delete restrict;

/*Constraint - Tabela de Estádios*/

/*Criação da constraint "FK_ESTADIOS_PAIS" na tabela Estádios, que ira permitir
que a chave estrangeira "id_pais" funcione de modo restrito.*/
alter table Estadios add constraint FK_ESTADIOS_PAIS
foreign key(id_pais) references Estadios(id_estadios) on delete restrict;

/*Criação da constraint "FK_ESTADIOS_CIDADES" na tabela Estádios, que ira permitir
que a chave estrangeira "id_cidade" funcione de modo restrito.*/
alter table Estadios add constraint FK_ESTADIOS_CIDADES
foreign key(id_cidade) references Estadios(id_estadios) on delete restrict;

/*Constraint - Tabela de Cidade*/

/*Criação da constraint "FK_CIDADES_PAIS" na tabela Cidade, que ira permitir
que a chave estrangeira "id_pais" funcione de modo restrito.*/
alter table Cidades add constraint FK_CIDADES_PAIS
foreign key(id_pais) references Cidades(id_cidade) on delete restrict;

/*Constraint - Tabela de Gols*/

/*Criação da constraint "FK_GOLS_TIMES" na tabela Gols, que ira permitir
que a chave estrangeira "id_times" funcione de modo restrito.*/
alter table Gols add constraint FK_GOLS_TIMES
foreign key(id_times) references Gols(id_gols) on delete restrict;

/*Constraint - Tabela de Titulos*/

/*Criação da constraint "FK_TITULOS_TIMES" na tabela Titulos, que ira permitir
que a chave estrangeira "id_times" funcione de modo restrito.*/
alter table Titulos add constraint FK_TITULOS_TIMES
foreign key(id_times) references Titulos(id_titulos) on delete restrict;

/*Exercicio de número 6*/

/*Inner join que junta o nome dos times, da tabela "Times", 
e os gols totais, tabela "Gols", para poder visualizar a quantidade
de gols que cada time fez na competição.*/
select nome_times, gols_totais from times inner join gols
on times.id_times = gols.id_gols;

/*Inner join que junta o nome dos times, da tabela "Times", 
e os titulos totais, tabela "Titulos", para poder visualizar a quantidade
de titulos que cada time tem na competição.*/
select nome_times, titulos_totais from times inner join titulos
on titulos.id_titulos = times.id_times;

/*Inner join que junta o nome dos times, da tabela "Times", 
e os nomes dos estádios, tabela "Estadios", para poder visualizar
qual é o respectivo estádio que cada time usou durante os jogos.*/
select nome_times, nome_estadios from times inner join estadios
on estadios.id_estadios = times.id_times;

/*Inner join que junta o nome dos times, da tabela "Times", 
o nome das cidades, tabela "Cidades", e o nome dos países da tabela "Pais" 
para poder visualizar em qual pais e cidade esta localizado cada estádio.*/
select nome_estadios, nome_cidade, nome_pais from estadios inner join cidades
on cidades.id_cidade = estadios.id_estadios inner join pais on pais.id_pais = estadios.id_estadios;

/*Inner join que junta o nome dos times, da tabela "Times", 
e os jogadores, tabela "Jogadores", para poder visualizar
qual jogador é o respectivo capitão de cada equipe.*/
select nome_jogadores, nome_times from jogadores inner join times
on times.id_times = jogadores.id_jogadores;

/*Exercicio de número 7*/

/*Order by que exibe o nome dos jogadores pela ordem padrão.*/
select nome_jogadores from jogadores order by nome_jogadores;

/*Order by que exibe a capacidade de cada estádio por ordem decrescente.*/
select capacidade from estadios order by capacidade desc;

/*Order by que exibe os gols por ordem decrescente.*/
select gols_totais from gols order by gols_totais desc;

/*Order by que exibe o nome dos paises por ordem acrescente.*/
select nome_pais from pais order by nome_pais asc;

/*Order by que exibe o nome das cidades por ordem descrente.*/
select nome_cidade from cidades order by nome_cidade desc;

/*Exercicio de número 8*/

/*Group by que agrupa o nome dos times atráves de "times_do_mata_mata".*/
select nome_times as times_do_mata_mata from times group by nome_times;

/*Group by que agrupa o nome dos times atráves de "classificação".*/
select nome_times as classificação from times group by classificação;

/*Group by que agrupa o nome dos times que terminam com a letra "a" atráves de "times_do_mata_mata".*/
select nome_times as times_em_a from times where nome_times like '%a' group by times_em_a;

/*Group by que agrupa os gols totais, acima de 20, atráves de "gols_maior_20".*/
select gols_totais as gols_maior_20 from gols where gols_totais > 20 group by gols_maior_20;

/*Group by que agrupa os titulos totais, no total de 3 ou mais, atráves de "maiores_campeãos".*/
select titulos_totais as maiores_campeões from titulos where titulos_totais >= 3 group by maiores_campeões;

/*Exercicio de número 9*/

/*Código que junta as tabelas Cidades e Pais e permite visualaizar
de quais paises são as respectivas cidades de forma decrescente.*/
select nome_pais, nome_cidade from pais inner join cidades
on pais.id_pais = cidades.id_cidade order by nome_pais desc;

/*Código que junta as tabelas Times e Cidades e permite visualaizar
de quais cidades estes times pertencem de forma decrescente.*/
select nome_times, nome_cidade from times inner join cidades
on times.id_times = cidades.id_cidade order by nome_times asc;

/*Código que junta as tabelas Titulos e Estadios e permite visualaizar
de quantos titulos cada estádio tem em seu museu de forma decrescente.*/
select titulos_totais, nome_estadios from titulos inner join estadios
on titulos.id_titulos = estadios.id_estadios order by titulos_totais desc;

/*Exercicio de número 10*/

/*Suma todos os gols.*/
select sum(gols_totais) from gols;

/*Faz a média de todos os gols.*/
select avg(gols_totais) from gols;

/*Suma todos os titulos.*/
select sum(titulos_totais) from titulos;

/*Faz a média todos os titulos e junta ao grupo "media_titulos_totais".*/
select avg(titulos_totais) as media_titulos_total from titulos;

/*Faz a média todos os times que tenham mais de um titulo e junta ao grupo "media_titulos_campeões".*/
select avg(titulos_totais) as media_titulos_campeões from titulos where titulos_totais >= 1;

/*Suma todos as capacidades dos estádios.*/
select sum(capacidade) from estadios;

/*Faz a média da capacidade de todos os estádios.*/
select avg(capacidade) from estadios;

/*Exercicio de número 11*/

/*Criação da view "atual_campeão", que vai permitir visualizar o nome "Flamengo", 
como o atual campeão da competição.*/
create view atual_campeão as select * from times where nome_times = 'Flamengo';
select * from atual_campeão;

/*Criação da view "maior_campeão", que vai permitir visualizar o nome "Boca Juniors",
como o maior campeão da competição entre os times listados.*/
create view maior_campeão as select * from times where nome_times = 'Boca Juniors';
select * from maior_campeão;

/*Criação da view "nunca_ganhou", que vai permitir visualizar o nome "Fortaleza EC"
como o time que nunca foi campeão da competição entre os times listados.*/
create view nunca_ganhou as select * from times where nome_times = 'Fortaleza EC';
select * from nunca_ganhou;

/*Criação da view "vice_campeão", que vai permitir visualizar o nome "Athletico Paranaense"
como o atual vice campeão da competição entre os times listados.*/
create view vice_campeão as select * from times where nome_times = 'Athletico Paranaense';
select * from vice_campeão;

/*Criação da view "ultimo_vice_campeão", que vai permitir visualizar o nome "Flamengo"
como o último vice campeão da competição entre os times listados.*/
create view ultimo_vice_campeão as select * from times where nome_times = 'Flamengo';
select * from ultimo_vice_campeão;

/*Exercicio de número 12*/
start transaction;

 /*Para inserir "Internacional" na tabela Times*/
insert into times values
('17', 'Internacional', '17','17','17','17','17','17');
savepoint times1;
rollback to times1;

/*Para inserir "Nacional" na tabela Times*/
insert into times values
('18', 'Nacional', '18','18','18','18','18','18');
savepoint times2;
rollback to times2;

/*Para inserir "Aimoré" na tabela Times*/
insert into times values
('19', 'Aimoré', '19','19','19','19','19','19');
savepoint times3;
rollback to times3;

/*Para inserir "Brasil de Pelotas" na tabela Times*/
insert into times values
('20', 'Brasil de Pelotas', '20','20','20','20','20','20');
savepoint times4;
rollback to times4;

/*Para inserir "São Paulo" na tabela Times*/
insert into times values
('21', 'São Paulo', '21','21','21','21','21','21');
savepoint times5;
rollback to times5;

/*Exercicio de número 13*/
create user pelé@localhost identified by 'rei'; /*Criação do usuário "Pelé"*/
create user mexicano@localhost identified by 'chicha'; /*Criação do usuário "Mexicano"*/
create user marta@localhost identified by 'rainha'; /*Criação do usuário "Marta"*/

drop user pelé@localhost;
drop user mexicano@localhost;
drop user marta@localhost;

grant all on Exercicios.atual_campeão to pelé@localhost; /*Permite o usuário "Pelé" ter acesso a View "atual_campeão"*/
grant all on Exercicios.maior_campeão to pelé@localhost; /*Permite o usuário "Pelé" ter acesso a View "maior_campeão"*/
grant all on Exercicios.nunca_ganhou to pelé@localhost; /*Permite o usuário "Pelé" ter acesso a View "nunca_ganhou"*/
grant all on Exercicios.vice_campeão to pelé@localhost; /*Permite o usuário "Pelé" ter acesso a View "vice_campeão"*/
grant all on Exercicios.ultimo_vice_campeão to pelé@localhost; /*Permite o usuário "Pelé" ter acesso a View "ultimo_vice_campeão"*/

grant insert on Exercicios.times to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Times*/
grant insert on Exercicios.jogadores to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Jogadores*/
grant insert on Exercicios.estadios to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Estádios*/
grant insert on Exercicios.cidades to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Cidades*/
grant insert on Exercicios.pais to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Pais*/
grant insert on Exercicios.gols to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Gols*/
grant insert on Exercicios.titulos to mexicano@localhost; /*Permite o usuário "Mexicano" inserir dados á tabela Titulos*/

grant select on Exercicios.times to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Times*/
grant select on Exercicios.jogadores to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Jogadores*/
grant select on Exercicios.estadios to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Estádios*/
grant select on Exercicios.cidades to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Cidades*/
grant select on Exercicios.pais to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Pais*/
grant select on Exercicios.gols to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Gols*/
grant select on Exercicios.titulos to marta@localhost; /*Permite o usuário "Mexicano" visualizar á tabela Titulos*/

select * from TIMES;
select * from JOGADORES;
select * from ESTADIOS;
select * from CIDADES;
select * from PAIS;
select * from GOLS;
select * from TITULOS;
