DROP DATABASE IF EXISTS ACTIVIDAD;
CREATE DATABASE ACTIVIDAD;
USE ACTIVIDAD;

CREATE TABLE FABRICANTE (
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE PRODUCTO (
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DOUBLE,
    codigo_fabr INT(10),
    CONSTRAINT fk_codigo_fabr FOREIGN KEY (codigo_fabr) REFERENCES FABRICANTE(codigo)
);
