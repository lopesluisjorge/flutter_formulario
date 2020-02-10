import 'package:flutter/material.dart';

class PageDetalheInvestimento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
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
          _titulo(""),
          _corpo(""),
        ],
      ),
    );
  }

  _titulo(String txt) {
    return Text(txt,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  _corpo(String txt) {
    return Text(txt,
        style: TextStyle(
          fontSize: 20,
        ));
  }
}
