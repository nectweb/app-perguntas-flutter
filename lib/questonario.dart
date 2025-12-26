import 'package:flutter/material.dart';
import 'package:perguntas_e_respostas/questao.dart';
import 'package:perguntas_e_respostas/respostas.dart';

class Questonario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaRespondida;
  final void Function(int) quandoRespondido;

  const Questonario({
    required this.perguntas,
    required this.perguntaRespondida,
    required this.quandoRespondido,
    super.key,
  });

  bool get temPerguntaSelecionado {
    return perguntaRespondida < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionado
        ? perguntas[perguntaRespondida]['respostas']
              as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaRespondida]['texto'].toString()),
        ...respostas.map((textoResp) {
          return Respostas(
            textoResp['texto'].toString(),
            () => quandoRespondido(int.parse(textoResp['nota'].toString())),
          );
        }),
      ],
    );
  }
}
