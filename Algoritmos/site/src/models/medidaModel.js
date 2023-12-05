var database = require("../database/config");

function buscarUltimasMedidas() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select truncate(avg(pontuacao),0) as Media from Pontos`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select truncate(avg(pontuacao),0) as Media from Pontos`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idUsuario, idPokemon) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `UPDATE Usuario SET fkPokemon = '${idPokemon}' WHERE id = '${idUsuario}';`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `UPDATE Usuario SET fkPokemon = '${idPokemon}' WHERE id = '${idUsuario}';`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosGrafico() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT 
		(SELECT COUNT(fkPokemon) AS 'Bulbasaur' FROM Usuario WHERE fkPokemon = '1') AS 'BulbasaurResultado',
        (SELECT COUNT(fkPokemon) AS 'Charmander' FROM Usuario WHERE fkPokemon = '2') AS 'CharmanderResultado',
        (SELECT COUNT(fkPokemon) AS 'Squirtle' FROM Usuario WHERE fkPokemon = '3') AS 'SquirtleResultado' FROM Usuario;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT 
		(SELECT COUNT(fkPokemon) AS 'Bulbasaur' FROM Usuario WHERE fkPokemon = '1') AS 'BulbasaurResultado',
        (SELECT COUNT(fkPokemon) AS 'Charmander' FROM Usuario WHERE fkPokemon = '2') AS 'CharmanderResultado',
        (SELECT COUNT(fkPokemon) AS 'Squirtle' FROM Usuario WHERE fkPokemon = '3') AS 'SquirtleResultado' FROM Usuario;`;
    }
     else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarDadosGrafico
}
