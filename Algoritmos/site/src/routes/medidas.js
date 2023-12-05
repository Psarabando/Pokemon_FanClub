var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.post("/cadastrarPokemon", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/dadosGrafico", function (req, res) {
    medidaController.buscarDadosGrafico(req, res);
})

module.exports = router;