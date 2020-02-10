import 'package:flutter/material.dart';
import 'package:investtest/screens/page_menu.dart';

class HomePage extends StatelessWidget {
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
        children: <Widget>[
          _imagem('assets/images/stock-exchange-market.png'),
          _texto('Negociações na bolsa de valores'),
          _button(context),
        ],
      ),
    );
  }

  _imagem(String url) {
    return Image.asset(url);
  }

  _texto(String texto) {
    return Text(
      texto,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  _button(BuildContext context) {
    return RaisedButton(
      child: Text('Avançar'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PageMenu();
        }));
      },
    );
  }
}
