import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Respostas(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
        child: Text(texto, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
