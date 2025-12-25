import 'package:flutter/material.dart';
import 'package:perguntas_e_respostas/questao.dart';
import 'package:perguntas_e_respostas/respostas.dart';

dynamic main() => runApp(_PerguntasApp());

class _PerguntasState extends State<_PerguntasApp> {
  var _perguntaRespondida = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual seu melhor amigo(a)?",
      'respostas': ['Thomas', 'John', 'Leo', 'Tiago'],
    },
    {
      'texto': "Qual seu animal favorito?",
      'respostas': ['Gato', 'Leão', 'Tigre', 'Zebra'],
    },
    {
      'texto': "Qual sua comida favorita?",
      'respostas': ['Bacon', 'Bolacha', 'Pipoca', 'Macarrão'],
    },
  ];

  int get() {
    return _perguntaRespondida;
  }

  int set(int value) {
    return _perguntaRespondida = value;
  }

  final List<Widget> respostas = [];

  void _resposta(String resp) {
    if (temPerguntaSelecionado) {
      setState(() {
        _perguntaRespondida++;
      });
    }
  }

  bool get temPerguntaSelecionado {
    return _perguntaRespondida < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaSelecionado
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaRespondida]['texto'].toString()),
                  for (String textoResp
                      in _perguntas[_perguntaRespondida]['respostas']
                          as List<String>)
                    Respostas(textoResp, () => _resposta(textoResp)),
                ],
              )
            : Center(child: Text('Parabéns!!', style: TextStyle(fontSize: 18))),
      ),
    );
  }
}

class _PerguntasApp extends StatefulWidget {
  @override
  _PerguntasState createState() {
    return _PerguntasState();
  }
}
