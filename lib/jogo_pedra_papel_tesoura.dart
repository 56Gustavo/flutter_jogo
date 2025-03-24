import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('imagem/padrao.png')!;
  var _mensagem = 'Escolha sua opção abaixo';

  final Map<String, AssetImage> _opcaoImagem = {
    "pedra": AssetImage("imagem/pedra.png"),
    "papel": AssetImage("imagem/papel.png"),
    "tesoura": AssetImage("imagem/tesoura.png")
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      this._imagemApp = _opcaoImagem[escolhaApp]!;

      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
        this._mensagem = "Parabéns!!! Você ganhou";
      } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
        this._mensagem = "Você perdeu! burrão!";
      } else {
        this._mensagem = "Empatamos!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(204, 172, 172, 172), // Cor de fundo amarela
      appBar: AppBar(
        title: Text(
          'PEDRA, PAPEL OU TESOURA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160), // Cor do AppBar amarela
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Texto em preto
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Texto em preto
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagem/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagem/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagem/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
          // Botão de voltar ao Home
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela inicial
              },
              child: const Text('Voltar ao Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.black, // Texto em preto
              ),
            ),
          ),
        ],
      ),
    );
  }
}