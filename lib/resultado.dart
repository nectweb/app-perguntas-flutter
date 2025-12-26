import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int notaFinal;
  final void Function() quandoReniciarQuestionario;
  const Resultado({
    required this.notaFinal,
    required this.quandoReniciarQuestionario,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Parabéns!! \nSua pontuação final: $notaFinal',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReniciarQuestionario,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
          child: Text(
            'Reniciar!!',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
