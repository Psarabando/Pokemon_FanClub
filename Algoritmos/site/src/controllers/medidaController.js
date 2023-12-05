var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    // const limite_linhas = 7;

    // var idPontos = req.params.idPontos;

    // console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a média de pontos.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscarMedidasEmTempoReal(req, res) {

    // var idAquario = req.params.idAquario;
    var idUsuario = req.body.idUsuarioServer;

    if (idUsuario == undefined) {
        res.status(400).send("O idUsuario está undefined!");
    }

    console.log(`Cadastrando o Bulbasaur na tabela usuário`);

    medidaModel.buscarMedidasEmTempoReal().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarDadosGrafico(req, res) {

    // var idAquario = req.params.idAquario;
    // var idUsuario = req.body.idUsuarioServer;

    // if (idUsuario == undefined) {
    //     res.status(400).send("O idUsuario está undefined!");
    // }

    console.log(`Buscando os dados de porcentagem dos pokémons`);

    medidaModel.buscarDadosGrafico().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarDadosGrafico
}