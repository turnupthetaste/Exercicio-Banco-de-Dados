--Exercicio 04--

create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='disponivel' or value='alugado');
create table tbl_cliente (codigo_cliente integer PRIMARY KEY, nome text not null, cidade text, endereco text);
create table tbl_titulo (codigo_titulo integer primary key, titulo text not null, descricao text, categoria chk_categoria);
create table tbl_livros (cod_livro integer PRIMARY KEY, codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'disponivel');
create table tbl_emprestimo (numero_emprestimo integer PRIMARY KEY, codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), codigo_livro integer REFERENCES tbl_livros(cod_livro));

insert into tbl_cliente values
(1,'João Silva','São Paulo','Rua A, 123'),(2,'Maria Santos','Rio de Janeiro','Av. B, 456'),(3,'Pedro Almeida','Belo Horizonte','Rua C, 789'),(4,'Ana Oliveira','Salvador','Av. D, 1011'),(5,'Carlos Lima','Brasília','Rua E, 1213');

insert into tbl_titulo values
(1,'Aventuras Urbanas','Uma História Emocionante','DRAMA'),(2,'Mistérios Antigos','Enigmas por Resolver','COMEDIA'),(3,'Amor nas Estrelas','Um romance intergalático','DRAMA'),(4,'Código Enigmático','Segredos Ocultos','COMEDIA'),(5,'Histórias Perdidas','Contos esquecidos','DRAMA');

insert into tbl_livros values
(1,1,'disponivel'),(2,1,'alugado'),(3,2,'disponivel'),(4,3,'alugado'),(5,4,'disponivel');

insert into tbl_emprestimo values
(1,1,2),(2,2,4),(3,3,1),(4,4,5),(5,5,3);

select nome from tbl_cliente;

select * from tbl_cliente
where cidade like 'São Paulo';

select * from tbl_cliente 
where codigo_cliente >3;

select titulo from tbl_titulo;

create table tbl_cliente2 (codigo integer PRIMARY KEY);

insert into tbl_cliente2 (codigo) select codigo_cliente from tbl_cliente;

update tbl_livros set status = 'disponivel';

delete from tbl_cliente2
where codigo >3;
