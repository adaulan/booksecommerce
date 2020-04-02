/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Adaulan 
 * Created: 31/03/2020
 */
        CREATE DATABASE ECOMMERCE_PROJECT;

        USE ECOMMERCE_PROJECT;

        CREATE TABLE PRODUTOS(
        ID 		INT NOT NULL AUTO_INCREMENT,
        TITULO	VARCHAR (255) NOT NULL UNIQUE,
        AUTOR		VARCHAR (255) NOT NULL,
        EDITORA		VARCHAR (255) NOT NULL,
        DESCRICAO	TEXT NOT NULL,
        IMAGEM LONGBLOB,
        VALORVENDA	FLOAT4 NOT NULL,
        VALORCUSTO	FLOAT4 NOT NULL,
        CATEGORIA	VARCHAR (30) NOT NULL,
        QUANTIDADE 	INT NOT NULL,
        DATACADASTRO    VARCHAR(255),
        NUMEROPAGINA INT,
        ACABAMENTO VARCHAR(255),
        IDIOMA VARCHAR(255),
        ALTURA VARCHAR(255),
        LARGURA VARCHAR(255),
        PESO FLOAT4,
        ISBN VARCHAR(255),
        TAG VARCHAR(255),
        CONSTRAINT PK_PRODUTOS PRIMARY KEY (ID)
        );

        INSERT INTO CATEGORIA(NOME) VALUES ("Terror");
        INSERT INTO CATEGORIA(NOME) VALUES ("Ação");
        INSERT INTO CATEGORIA(NOME) VALUES ("Aventura");
        INSERT INTO CATEGORIA(NOME) VALUES ("Horror");
        INSERT INTO CATEGORIA(NOME) VALUES ("Suspense");
        INSERT INTO CATEGORIA(NOME) VALUES ("Romance");
        INSERT INTO CATEGORIA(NOME) VALUES ("Cronica");
        INSERT INTO CATEGORIA(NOME) VALUES ("Biografia");
        INSERT INTO CATEGORIA(NOME) VALUES ("Games");
        INSERT INTO CATEGORIA(NOME) VALUES ("Investigação");