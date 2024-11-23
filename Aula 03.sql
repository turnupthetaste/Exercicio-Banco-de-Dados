--Exercicio 03--
CREATE TABLE tbl_cliente(
codigo_cliente INTEGER PRIMARY KEY,
Nome TEXT NOT NULL,
Cidade TEXT,
Endereço TEXT
);

CREATE TABLE tbl_titulo(
codigo_titulo INTEGER PRIMARY KEY,
titulo INTEGER,
categoria TEXT
);

CREATE DOMAIN status_livro TEXT CHECK(VALUE IN ('DISPONIVEL', 'INDISPONIVEL'));

CREATE TABLE tbl_livros(
codigo_livro SERIAL PRIMARY KEY,
codigo_titulo INTEGER NOT NULL REFERENCES tbl_titulo(codigo_titulo) ,
status status_livro DEFAULT 'DISPONIVEL'
);

CREATE TABLE tbl_emprestimo (
numero_emprestimo SERIAL PRIMARY KEY,
codigo_cliente INTEGER NOT NULL REFERENCES tbl_cliente(codigo_cliente),
codigo_livro INTEGER NOT NULL REFERENCES tbl_livros(codigo_livro)
);
