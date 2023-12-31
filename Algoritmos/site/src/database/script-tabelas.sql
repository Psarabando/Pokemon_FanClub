-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE Pokemon;
USE Pokemon;

CREATE TABLE Pokemon (
idPokemon INT PRIMARY KEY AUTO_INCREMENT,
nomePokemon VARCHAR(45) NOT NULL,
tipagem1 VARCHAR(45) NOT NULL,
	CONSTRAINT chkTipagem1 CHECK (tipagem1 IN ('Planta', 'Fogo', 'Água', 'Veneno')),
tipagem2 VARCHAR(45),
	CONSTRAINT chkTipagem2 CHECK (tipagem2 IN ('Planta', 'Fogo', 'Água', 'Veneno'))
);

CREATE TABLE Usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idade INT NOT NULL,
email VARCHAR(45) UNIQUE,
senha VARCHAR(45) NOT NULL,
fkPokemon INT,
CONSTRAINT fkPokemon FOREIGN KEY (fkPokemon)
	REFERENCES Pokemon(idPokemon)
);

CREATE TABLE Pontos (
idPontos INT AUTO_INCREMENT,
pontuacao INT,
dtPontuacao DATETIME,
fkUsuario INT,
CONSTRAINT fkUsuarioPontos FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(id),
PRIMARY KEY(idPontos, fkUsuario)
);

CREATE TABLE Endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
pais VARCHAR(45) NOT NULL,
estado VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL,
bairro VARCHAR(45) NOT NULL,
fkUsuario INT NOT NULL UNIQUE,
CONSTRAINT fkUsuarioEndereco FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(id)
);

-- Comandos SQL

INSERT INTO Pokemon VALUES
	(DEFAULT, 'Bulbasaur', 'Planta', 'Veneno'),
    (DEFAULT, 'Charmander', 'Fogo', NULL),
    (DEFAULT, 'Squirtle', 'Água', NULL);

SELECT * FROM Usuario;
SELECT * FROM Pokemon;
SELECT * FROM Pontos;
SELECT * FROM Endereco;

SELECT 
	(SELECT COUNT(fkPokemon) AS 'Bulbasaur' FROM Usuario WHERE fkPokemon = '1') AS 'BulbasaurResultado',
	(SELECT COUNT(fkPokemon) AS 'Charmander' FROM Usuario WHERE fkPokemon = '2') AS 'CharmanderResultado',
	(SELECT COUNT(fkPokemon) AS 'Squirtle' FROM Usuario WHERE fkPokemon = '3') AS 'SquirtleResultado' FROM Usuario;


INSERT INTO Usuario VALUES
	(Default, 'Pedro', '18', 'pedro.saraujo@sptech.school', '130505', '1'),
    (Default, 'Rafael', '13', 'sarabando.rafa@gmail.com', '777777', '2'),
    (Default, 'Lorenzo', '19', 'lorenzo.begliomini@gmail.com', '666666', '2'),
    (Default, 'Guilherme', '18', 'guilhermeConstantinov', '333333', '2'),
    (Default, 'Fernanda', '35', 'fersarabando@gmail.com', '555555', '3'),
    (Default, 'Anna', '19', 'annaBeatriz@gmail.com', '444444', '3');

DROP DATABASE pokemon;