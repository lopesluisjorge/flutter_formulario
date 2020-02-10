import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as converter;

import 'package:investtest/models/negocacao.dart';
import 'package:investtest/screens/page_detalhe_investimento.dart';

class PageListaInvestimentosSqlite extends StatefulWidget {
  @override
  PageListaInvestimentosSqliteState createState() => PageListaInvestimentosSqliteState();
}

class PageListaInvestimentosSqliteState extends State<PageListaInvestimentosSqlite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Negociações SQLite'),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(6),
          child: _mountDynamicList(context)),
    );
  }

  _mountDynamicList(BuildContext context) {
    return FutureBuilder(
        future: _buscarNegociacoes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _crialistview(snapshot.data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List<Negociacao>> _buscarNegociacoes() async {
    List<Negociacao> lista = new List<Negociacao>();

    String url = "https://api.myjson.com/bins/dl3aw";

    http.Response resposta = await http.get(url);
    if (resposta.statusCode == HttpStatus.ok) {
      var listaretorno = converter.jsonDecode(resposta.body);
      for (var negociacao in listaretorno) {
        print(negociacao);
        Negociacao objnegociacao = Negociacao.fromJson(negociacao);
        lista.add(objnegociacao);
      }
    } else {
      print("Falha ao receber os dados da Internet.");
    }

    return Future.value(lista);
  }

  _crialistview(negociacoes) {
    return ListView.builder(
      itemCount: negociacoes.length,
      itemBuilder: (context, index) {
        Negociacao itemnegociacao = negociacoes[index];

        var corCircleAvatar;
        if (itemnegociacao.tipoOperacao == 'Compra') {
          corCircleAvatar = Colors.blue;
        } else {
          corCircleAvatar = Colors.red;
        }

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: corCircleAvatar,
          ),
          title: Text(itemnegociacao.ticker),
          subtitle: Text(itemnegociacao.tipoOperacao),
          trailing: Text(itemnegociacao.preco.toString()),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PageDetalheInvestimento(itemnegociacao);
            }));
          },
        );
      },
    );
  }
}
