-- Criação e uso da Database Pokemon

CREATE DATABASE Pokemon;
USE Pokemon;

DROP DATABASE Pokemon;
-- Criação das tabelas

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
dtPontuacao DATETIME DEFAULT CURRENT_TIMESTAMP,
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

DROP DATABASE pokemon;

INSERT INTO Usuario VALUES
	('1', '1', '1', '1', '1');

INSERT INTO Pontos (pontuacao, fkUsuario) VALUES
	('1000', '1');