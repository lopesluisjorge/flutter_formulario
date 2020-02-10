import 'package:flutter/material.dart';
import 'package:investtest/models/negocacao.dart';
import 'package:investtest/screens/negociacao_form.dart';
import 'package:investtest/screens/page_lista_investimentos.dart';
import 'package:investtest/screens/page_lista_investimentos_sqlite.dart';

class PageMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investimentos'),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _botao(context, 'Formulário', NegociacaoForm()),
          _botao(context, 'Listagem SQLite', PageListaInvestimentosSqlite()),
          _botao(context, 'Listagem API Fake', PageListaInvestimentos()),
        ],
      ),
    );
  }


  _botao(BuildContext context, String texto, Widget widget) {
    return RaisedButton(
      child: Text(texto),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
    );
  }
}
