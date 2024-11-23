CREATE DATABASE bd_aula09;
\c bd_aula09
create table tbl_fornecedor (cod_fornecedor serial primary key, nome text not null, status integer, cidade text);
create table tbl_peca (cod_peca serial primary key, nome text not null, cor text, preco numeric, cidade text);
create table tbl_estoque (cod_compra serial primary key, 
						 cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
						cod_peca integer references tbl_peca(cod_peca),
						quantidade integer);
						
insert into tbl_fornecedor(nome,status,cidade) 
values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');

INSERT INTO tbl_peca(nome, cor, preco, cidade) values
('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
('TESOURA','VERMELHA',12,'LONDRES');

INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
(1,1,30),(2,1,30),(3,2,10),(3,3,50);


--1 Liste os nomes das peças e a soma das suas respectivas quantidades

SELECT p.nome AS nome_peca, SUM(e.quantidade) AS total_quantidade
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
GROUP BY p.nome;

--2 Liste os nomes das peças e a soma das suas respectivas quantidades, caso a soma das peças seja maior que 20

SELECT p.nome AS nome_peca, SUM(e.quantidade) AS total_quantidade
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
GROUP BY p.nome
HAVING SUM(e.quantidade) > 20;

--3 Listar quantidade de fornecedores em cada cidade.

SELECT f.cidade, COUNT(f.cod_fornecedor) AS quantidade_fornecedores
FROM tbl_fornecedor f
GROUP BY f.cidade;


--4 listar quantidade de peças de cada cor

SELECT p.cor, SUM(e.quantidade) AS total_quantidade
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
GROUP BY p.cor;


--5 listar quantidade de peças de cada cor. Mostrar somente as que possuem mais de 1 peça.

SELECT p.cor, SUM(e.quantidade) AS total_quantidade
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
GROUP BY p.cor
HAVING SUM(e.quantidade) > 1;


