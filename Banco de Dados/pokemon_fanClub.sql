-- Criação e uso da Database Pokemon

CREATE DATABASE Pokemon;
USE Pokemon;

-- Criação das tabelas

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45) NOT NULL,
idade INT NOT NULL,
senha VARCHAR(45) NOT NULL
);

CREATE TABLE Email (
idEmail INT AUTO_INCREMENT,
email VARCHAR(45) UNIQUE NOT NULL,
fkUsuario INT,
CONSTRAINT fkUsuarioEmail FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(idUsuario),
PRIMARY KEY(idEmail, fkUsuario)
);

CREATE TABLE Pontos (
idPontos INT AUTO_INCREMENT,
pontuacao INT,
dtPontuacao DATETIME,
fkUsuario INT,
CONSTRAINT fkUsuarioPontos FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(idUsuario),
PRIMARY KEY(idPontos, fkUsuario)
);

CREATE TABLE Pokemon (
idPokemon INT PRIMARY KEY AUTO_INCREMENT,
nomePokemon VARCHAR(45) NOT NULL,
tipagem1 VARCHAR(45) NOT NULL,
	CONSTRAINT chkTipagem1 CHECK (tipagem1 IN ('Planta', 'Fogo', 'Água', 'Veneno')),
tipagem2 VARCHAR(45),
	CONSTRAINT chkTipagem2 CHECK (tipagem2 IN ('Planta', 'Fogo', 'Água', 'Veneno'))
);

CREATE TABLE PokemonInicial (
fkUsuario INT,
CONSTRAINT fkUsuarioPokemonInicial FOREIGN KEY (fkUsuario)
	REFERENCES Usuario(idUsuario),
fkPokemon INT,
CONSTRAINT fkPokemon FOREIGN KEY (fkPokemon)
	REFERENCES Pokemon(idPokemon),
PRIMARY KEY (fkUsuario, fkPokemon)
);

-- Comandos SQL

DROP DATABASE pokemon;