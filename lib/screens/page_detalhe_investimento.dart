import 'package:flutter/material.dart';
import 'package:investtest/models/negocacao.dart';

class PageDetalheInvestimento extends StatelessWidget {
  final Negociacao _negociacao;

  PageDetalheInvestimento(this._negociacao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Negociação'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _titulo(_negociacao.ticker),
          _subtitulo(_negociacao.tipoOperacao),
          _corpo()
        ],
      ),
    );
  }

  _titulo(String texto) {
    return Text(texto,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  _subtitulo(String texto) {
    return Text(texto,
        style: TextStyle(
          fontSize: 20,
        ));
  }

  _corpo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

      ],
    );
  }
}
