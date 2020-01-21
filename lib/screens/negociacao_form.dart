import 'package:flutter/material.dart';
import 'package:investtest/models/negocacao.dart';

var ultimoId = 0;
var negociacaoRepo = <Negociacao>[];
var corretoraRepo = <String>['Clear', 'Easynvest', 'Rico', 'XP', 'Órama']
    .map((corretora) => corretora.toUpperCase());
const tickerRepo = <String>[
  'ITSA3',
  'ITSA4',
  'B3SA3',
  'PETR4',
  'KLBN3',
  'KLBN4',
  'KLBN11',
  'ENBR3',
  'TRPL4',
  'ITUB3',
  'ITUB4'
];

class NegociacaoForm extends StatefulWidget {
  @override
  _NegociacaoFormState createState() => _NegociacaoFormState();
}

class _NegociacaoFormState extends State<NegociacaoForm> {
  final _chaveForm = GlobalKey<FormState>();

  var _corretora;
  var _ticker;
  var _tipoOperacao = 'Compra';
  var _quantidade;
  var _preco;
  var _dataOperacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de negociação'),
        ),
        body: Form(
          key: _chaveForm,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Ticker'),
                  validator: (ticker) {
                    if (ticker.isEmpty) {
                      return 'Informe o ticker';
                    }
                    if (!tickerRepo.contains(ticker.toUpperCase())) {
                      return 'Ticker Inválido';
                    }
                    return null;
                  },
                  onSaved: (ticker) {
                    _ticker = ticker.toUpperCase();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Corretora'),
                  validator: (corretora) {
                    if (corretora.isEmpty) {
                      return 'Informe a corretora';
                    }
                    if (corretora.isEmpty ||
                        !corretoraRepo.contains(corretora.toUpperCase())) {
                      return 'Corretora Inválida';
                    }
                    return null;
                  },
                  onSaved: (corretora) {
                    _corretora = corretora.toUpperCase();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Compra'),
                    Radio(
                      value: 'Compra',
                      groupValue: _tipoOperacao,
                      onChanged: (valor) {
                        setState(() => _tipoOperacao = valor);
                      },
                    ),
                    Text('Venda'),
                    Radio(
                      value: 'Venda',
                      groupValue: _tipoOperacao,
                      onChanged: (valor) {
                        setState(() => _tipoOperacao = valor);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  validator: (quantidade) {
                    if (quantidade.isEmpty) {
                      return 'Informe a quantidade';
                    }
                    if (double.parse(quantidade).toInt() <= 0) {
                      return 'Quantidade deve ser positiva';
                    }
                    return null;
                  },
                  onSaved: (quantidade) {
                    _quantidade = double.parse(quantidade).toInt();
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Preço'),
                  validator: (preco) {
                    if (preco.isEmpty) {
                      return 'Informe o preço';
                    }
                    if (double.parse(preco) < 0.01) {
                      return 'preco deve ser positivo';
                    }
                    return null;
                  },
                  onSaved: (preco) {
                    _preco = double.parse(preco);
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Data de negociação'),
                  validator: (dataOperacao) {
                    Pattern pattern = r'^[0-3][0-9]\/[0-1][0-9]\/[1-2][0-9]{3}$';
                    RegExp regex = new RegExp(pattern);
                    if (dataOperacao.isEmpty) {
                      return 'Informe a data de negociação';
                    }
                    if (!regex.hasMatch(dataOperacao)) {
                      return 'data de negociação inválida';
                    }
                    return null;
                  },
                  onSaved: (dataOperacao) {
                    _dataOperacao = dataOperacao;
                  },
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                    child: Text('Cadastrar'),
                    onPressed: () {
                      if (_chaveForm.currentState.validate()) {
                        _chaveForm.currentState.save();
                        final Negociacao negociacao = Negociacao(
                            ultimoId++,
                            _corretora,
                            _ticker,
                            _tipoOperacao,
                            _quantidade,
                            _preco,
                            _dataOperacao);
                        print(negociacao);

                        negociacaoRepo.add(negociacao);
                        print(negociacaoRepo);
                      }
                    },
                  )),
            ]),
          )),
        ));
  }
}
