CREATE DATABASE "curso-jsp"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       CONNECTION LIMIT = -1;
	   
	   
	   
CREATE SEQUENCE usersequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 8
  CACHE 1;
ALTER TABLE usersequence
  OWNER TO postgres;
	   
	   
CREATE TABLE usuario
(
  id bigint NOT NULL DEFAULT nextval('usersequence'::regclass),
  login character varying(500),
  senha character varying(20),
  CONSTRAINT usuario_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE usuario
  OWNER TO postgres;
  
 
ALTER TABLE usuario ADD COLUMN nome character varying(500); 
  
  INSERT INTO usuario(
            id, login, senha)
    VALUES (1, 'alex', 'alex');

INSERT INTO usuario(
            id, login, senha)
    VALUES (2, 'admin', 'admin');

ALTER TABLE usuario ADD COLUMN fone character varying(500); 

CREATE SEQUENCE usersequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 8
  CACHE 1;
ALTER TABLE usersequence
  OWNER TO postgres;

CREATE TABLE produto
(
  id bigint NOT NULL DEFAULT nextval('usersequence'::regclass),
  codigo character varying(30),
  nome character varying(300),
  quantidade bigint,
  valor decimal,
  CONSTRAINT produto_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE produto
  OWNER TO postgres;
    
ALTER TABLE public.usuario ADD COLUMN cep character varying(500);   

ALTER TABLE public.produto ADD constraint categoria_fk foreign key (categoria_id) 
references categoria (id)