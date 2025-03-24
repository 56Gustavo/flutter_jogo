import 'package:flutter/material.dart';
import 'jogo_pedra_papel_tesoura.dart'; // Importe o Jogo Pedra Papel Tesoura
import 'jogo_par_impar.dart'; // Importe o Jogo Par ou Impar

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(204, 172, 172, 172), // Cor de fundo verde
      appBar: AppBar(
        title: const Text('Escolha o Jogo'),
        backgroundColor: const Color.fromARGB(255, 160, 160, 160), // Cor do AppBar verde também
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha um jogo abaixo!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black, // Escrito em preto
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navega para o jogo Pedra, Papel ou Tesoura
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Jogo()),
                );
              },
              child: const Text('JokemPo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Cor do botão amarelo
                foregroundColor: Colors.black, // Cor do texto do botão (preto)
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega para o jogo Par ou Ímpar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JogoParImpar()),
                );
              },
              child: const Text('Par ou Ímpar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cor do botão vermelho
                foregroundColor: Colors.black, // Cor do texto do botão (preto)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
