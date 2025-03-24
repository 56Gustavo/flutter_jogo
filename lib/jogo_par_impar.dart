import 'package:flutter/material.dart';
import 'dart:math';

class JogoParImpar extends StatefulWidget {
  const JogoParImpar({super.key});

  @override
  _JogoParImparState createState() => _JogoParImparState();
}

class _JogoParImparState extends State<JogoParImpar> {
  TextEditingController _controller = TextEditingController();
  String _mensagem = 'Escolha "Par" ou "Ímpar" e um número de 0 a 10!';
  String _opcaoEscolhida = '';
  int _numeroApp = 0;
  String _resultado = '';

  void _verificarResultado(int numeroUsuario) {
    setState(() {
      _numeroApp = Random().nextInt(11); // Número aleatório entre 0 e 10
      int soma = numeroUsuario + _numeroApp;
      bool somaPar = soma % 2 == 0;

      // Verifica quem ganhou
      if ((_opcaoEscolhida == 'Par' && somaPar) || (_opcaoEscolhida == 'Ímpar' && !somaPar)) {
        _resultado = 'VENCEU! Você jogou $numeroUsuario, a máquina jogou $_numeroApp. Soma: $soma.';
      } else {
        _resultado = 'PERDEU! Você jogou $numeroUsuario, a máquina jogou $_numeroApp. Soma: $soma.';
      }
    });
  }

  void _escolherParOuImpar(String escolha) {
    setState(() {
      _opcaoEscolhida = escolha;
      _mensagem = 'Agora escolha um número de 0 a 10!';
    });
  }

  void _jogarNovamente() {
    setState(() {
      _controller.clear();
      _mensagem = 'Escolha "Par" ou "Ímpar" e um número de 0 a 10!';
      _opcaoEscolhida = '';
      _numeroApp = 0;
      _resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(204, 172, 172, 172),
      appBar: AppBar(
        title: const Text('Jogo Par ou Ímpar'),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          if (_opcaoEscolhida.isEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _escolherParOuImpar('Par'),
                  child: const Text('Escolher Par'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _escolherParOuImpar('Ímpar'),
                  child: const Text('Escolher Ímpar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          if (_opcaoEscolhida.isNotEmpty) ...[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Escolha um número de 0 a 10',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  int numeroUsuario = int.parse(_controller.text);
                  if (numeroUsuario >= 0 && numeroUsuario <= 10) {
                    _verificarResultado(numeroUsuario);
                  } else {
                    setState(() {
                      _resultado = 'Escolha um número válido de 0 a 10.';
                    });
                  }
                },
                child: const Text('Jogar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          if (_resultado.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _jogarNovamente,
                child: const Text('Jogar Novamente'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar ao Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
