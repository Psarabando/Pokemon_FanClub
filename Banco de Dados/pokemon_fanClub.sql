-- Criação e uso da Database Pokemon

CREATE DATABASE Pokemon;
USE Pokemon;

DROP DATABASE Pokemon;
-- Criação das tabelas

CREATE TABLE Usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idade INT NOT NULL,
email VARCHAR(45) UNIQUE,
senha VARCHAR(45) NOT NULL
);

SELECT * FROM Usuario;

DROP TABLE Usuario;

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