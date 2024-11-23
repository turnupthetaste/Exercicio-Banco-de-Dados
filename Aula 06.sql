--exemplo 1
\c bd_aula03
select * from tbl_cliente; --duas telas
insert into tbl_cliente values(1, 'Rodrigo','SJC','Centro'); --pgadmin
select * from tbl_cliente; --duas telas
commit; --pgadmin
-- exemplo 2
select * from tbl_cliente; --duas telas
insert into tbl_cliente values(2, 'Arley','Jacarei','Centro'); -- pgadmin
select * from tbl_cliente; --duas telas
rollback;--pgadmin
-- exemplo 3
select * from tbl_cliente; --duas telas
insert into tbl_cliente values(2, 'Arley','Jacarei','Centro'); -- pgadmin
select * from tbl_cliente; --duas telas
insert into tbl_cliente values(2, 'Gildarcio','Sao Paulo','Vila Madalena'); -- psql (hold) 
rollback;--pgadmin
select * from tbl_cliente; --duas telas
insert into tbl_cliente values(2, 'Arley','Jacarei','Centro'); -- pgadmin error

--exemplo 4

begin;--psql
select * from tbl_titulo;--duas telas
insert into tbl_titulo values (1,'LOTR','Livro legal'); --psql
insert into tbl_titulo values (2,'Harry Potter','Livro ok');--pgadmin
end; --psql
commit; --pgadmin

--exemplo 5
begin;--psql
select * from tbl_titulo;--duas telas
insert into tbl_titulo values (3,'Hobbit','interessante');--psql
insert into tbl_titulo values (3,'Pequeno Principe','Nao li');--pgadmin (hold)
select * from tbl_titulo;--duas telas
end;--psql

--exemplo 6
create table tbl_contas (cod_conta serial primary key, nome text, saldo real default 0);
insert into tbl_contas(nome,saldo) values ('Rodrigo',1000),('Arley',2000),('Gildarcio',1500);
select * from tbl_contas;
update tbl_contas set saldo = saldo-100 where cod_conta=2;
--deu pau no sistema!? caiu a energia ?
update tbl_contas set saldo = 2000 where cod_conta=2;

begin;
update tbl_contas set saldo = saldo-100 where cod_conta=2;
select * from tbl_contas;
savepoint debito_ok;
update tbl_contas set saldo = saldo+100 where cod_conta=3;
select * from tbl_contas;
ROLLBACK TO debito_ok;
select * from tbl_contas;
update tbl_contas set saldo = saldo+100 where cod_conta=1;
select * from tbl_contas;
commit;
