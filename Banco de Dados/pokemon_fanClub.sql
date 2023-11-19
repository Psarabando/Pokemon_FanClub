CREATE DATABASE Pokemon;
USE Pokemon;

CREATE TABLE Usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45) NOT NULL,
idade INT,
senha VARCHAR(45) NOT NULL
);

CREATE TABLE Email (
idEmail INT AUTO_INCREMENT,
email VARCHAR(45) UNIQUE NOT NULL,
fkUsuario INT,
CONSTRAINT fkUsuario FOREIGN KEY (fkUsuario)
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
nomePokemon VARCHAR(45),
tipagem1 VARCHAR(45) NOT NULL,
	CONSTRAINT chkTipagem1 CHECK (tipagem1 IN ('Planta', 'Fogo', 'Água', 'Veneno')),
tipagem2 VARCHAR(45),
	CONSTRAINT chkTipagem2 CHECK (tipagem2 IN ('Planta', 'Fogo', 'Água', 'Veneno'))
);

DROP DATABASE pokemon;