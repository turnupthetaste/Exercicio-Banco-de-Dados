CREATE DATABASE bd_sistema_bancario WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE public.fornecedores (
    "ID_FORNECEDOR" serial PRIMARY KEY,
    "NOME_FORNECEDOR" text NOT NULL,
    "CIDADE_FORNECEDOR" text NOT NULL
);

CREATE TABLE public.produtos (
    "ID_PRODUTO" serial PRIMARY KEY,
    "NOME_PRODUTO" text NOT NULL,
    "PRECO" real NOT NULL
);

CREATE TABLE public.pedidos (
    "ID_PEDIDO" serial PRIMARY KEY,
    "DATA_PEDIDO" date NOT NULL,
    "ID_FORNECEDOR" integer NOT NULL,
    FOREIGN KEY ("ID_FORNECEDOR") REFERENCES public.fornecedores("ID_FORNECEDOR")
    ON DELETE CASCADE
);

CREATE TABLE public.estoque (
    "ID_ESTOQUE" serial PRIMARY KEY,
    "ID_PRODUTO" integer NOT NULL,
    "QUANTIDADE" integer NOT NULL,
    FOREIGN KEY ("ID_PRODUTO") REFERENCES public.produtos("ID_PRODUTO")
    ON DELETE CASCADE
);

CREATE TABLE public.funcionarios (
    "ID_FUNCIONARIO" serial PRIMARY KEY,
    "NOME_FUNCIONARIO" text NOT NULL,
    "CARGO" text NOT NULL
);

CREATE TABLE public.cliente (
    "NOME_CLIENTE" text NOT NULL,
    "CIDADE_CLIENTE" text NOT NULL,
    "ENDERECO_CLIENTE" text NOT NULL,
    PRIMARY KEY ("NOME_CLIENTE")
);

CREATE TABLE public.agencia (
    "NOME_AGENCIA" text NOT NULL,
    "CIDADE_AGENCIA" text NOT NULL,
    "DEPOSITOS" real NOT NULL,
    PRIMARY KEY ("NOME_AGENCIA")
);

CREATE TABLE public.conta (
    "NUMERO_CONTA" integer NOT NULL,
    "NOME_AGENCIA" text NOT NULL,
    "SALDO" real NOT NULL,
    PRIMARY KEY ("NUMERO_CONTA"),
    FOREIGN KEY ("NOME_AGENCIA") REFERENCES public.agencia("NOME_AGENCIA")
    ON DELETE CASCADE
);

CREATE TABLE public.emprestimos (
    "NUMERO_EMPRESTIMO" integer NOT NULL,
    "NOME_AGENCIA" text NOT NULL,
    "VALOR" real NOT NULL,
    PRIMARY KEY ("NUMERO_EMPRESTIMO"),
    FOREIGN KEY ("NOME_AGENCIA") REFERENCES public.agencia("NOME_AGENCIA")
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS public.pedidos;
DROP TABLE IF EXISTS public.estoque;
DROP TABLE IF EXISTS public.produtos;
DROP TABLE IF EXISTS public.fornecedores;
DROP TABLE IF EXISTS public.funcionarios;

ALTER TABLE public.cliente RENAME TO tbl_cliente;
ALTER TABLE public.conta RENAME TO tbl_conta;
ALTER TABLE public.emprestimos RENAME TO tbl_emprestimo;
ALTER TABLE public.agencia RENAME TO tbl_agencia;

ALTER TABLE public.tbl_cliente 
ADD COLUMN CPF numeric, 
ADD COLUMN idade integer;

ALTER TABLE public.tbl_agencia RENAME COLUMN "CIDADE_AGENCIA" TO "ENDERECO_AGENCIA";

CREATE SCHEMA Bcr;
