var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    medidaModel.buscarUltimasMedidas().then((resultado) => {

        res.status(200).json(resultado);
    
    });
}


function buscarMedidasEmTempoReal(req, res) {

    // var idAquario = req.params.idAquario;
    var idUsuario = req.body.idUsuarioServer;
    var idPokemon = req.body.idPokemonServer;

    if (idUsuario == undefined) {
        res.status(400).send("O idUsuario está undefined!");
    }

    console.log(`Cadastrando o Bulbasaur na tabela usuário`);

    medidaModel.buscarMedidasEmTempoReal(idUsuario, idPokemon).then(function (resultado) {
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

    medidaModel.buscarDadosGrafico().then((resultado) => {

        res.status(200).json(resultado);
    
    });

}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarDadosGrafico
}