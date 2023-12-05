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

function buscarMedidasEmTempoReal(idUsuario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `UPDATE Usuario SET fkPokemon = '1' WHERE id = '${idUsuario}';`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `UPDATE Usuario SET fkPokemon = '1' WHERE id = '${idUsuario}';`;
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
        instrucaoSql = `SELECT COUNT(fkPokemon) AS 'Bulbasaur' FROM Usuario WHERE fkPokemon = '1';
        SELECT COUNT(fkPokemon) AS 'Charmander' FROM Usuario WHERE fkPokemon = '2';
        SELECT COUNT(fkPokemon) AS 'Squirtle' FROM Usuario WHERE fkPokemon = '3';`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT COUNT(fkPokemon) AS 'Bulbasaur' FROM Usuario WHERE fkPokemon = '1';
        SELECT COUNT(fkPokemon) AS 'Charmander' FROM Usuario WHERE fkPokemon = '2';
        SELECT COUNT(fkPokemon) AS 'Squirtle' FROM Usuario WHERE fkPokemon = '3';`;
    } else {
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
