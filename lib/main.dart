import 'package:flutter/material.dart';
import 'package:perguntas_e_respostas/questonario.dart';
import 'package:perguntas_e_respostas/resultado.dart';

dynamic main() => runApp(_PerguntasApp());

class _PerguntasState extends State<_PerguntasApp> {
  var _perguntaRespondida = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual seu melhor amigo(a)?",
      'respostas': [
        {'texto': 'Thomas', 'nota': 10},
        {'texto': 'John', 'nota': 8},
        {'texto': 'Leo', 'nota': 5},
        {'texto': 'Tiago', 'nota': 1},
      ],
    },
    {
      'texto': "Qual seu animal favorito?",
      'respostas': [
        {'texto': 'Gato', 'nota': 10},
        {'texto': 'Leão', 'nota': 8},
        {'texto': 'Tigre', 'nota': 5},
        {'texto': 'Zebra', 'nota': 2},
      ],
    },
    {
      'texto': "Qual sua comida favorita?",
      'respostas': [
        {'texto': 'Bacon', 'nota': 10},
        {'texto': 'Bolacha', 'nota': 7},
        {'texto': 'Pipoca', 'nota': 6},
        {'texto': 'Macarrão', 'nota': 4},
      ],
    },
  ];

  int get() {
    return _perguntaRespondida;
  }

  int set(int value) {
    return _perguntaRespondida = value;
  }

  final List<Widget> respostas = [];

  void _resposta(int nota) {
    setState(() {
      _perguntaRespondida++;
      _pontuacaoTotal += nota;
    });
  }

  void _reniciarQuestionario() {
    setState(() {
      _perguntaRespondida = 0;
      _pontuacaoTotal = 0;
    });
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
            ? Questonario(
                perguntas: _perguntas,
                perguntaRespondida: _perguntaRespondida,
                quandoRespondido: _resposta,
              )
            : Resultado(
                notaFinal: _pontuacaoTotal,
                quandoReniciarQuestionario: _reniciarQuestionario,
              ),
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
