class Negociacao {
  int _id;
  String _corretora;
  String _ticker;
  String _tipoOperacao;
  int _quantidade;
  double _preco;
  String _dataOperacao;

  Negociacao(this._id, this._corretora, this._ticker, this._tipoOperacao,
      this._quantidade, this._preco, this._dataOperacao);

  get id => _id;
  set id(v) => _id = v;

  get corretora => _corretora;
  set corretora(v) => _corretora = v;

  get ticker => _ticker;
  set ticker(v) => _ticker = v;

  get tipoOperacao => _tipoOperacao;
  set tipoOperacao(v) => _tipoOperacao = v;

  get quantidade => _quantidade;
  set quantidade(v) => _quantidade = v;

  get preco => _preco;
  set preco(v) => _preco = v;

  get dataOperacao => _dataOperacao;
  set dataOperacao(v) => _dataOperacao = v;

  @override
  String toString() {
    return "Negociacao{ id: $_id, corretora: $_corretora, ticker: $_ticker, tipoOperacao: $_tipoOperacao, quantidade: $_quantidade, preco: $_preco, dataOperacao: $_dataOperacao }";
  }

  Negociacao.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _ticker = json['ticker'];
    _tipoOperacao = json['tipoOperacao'];
    _corretora = json['corretora'];
    _quantidade = int.parse(json['quantidade']);
    _preco = double.parse(json['preco']);
    _dataOperacao = json['dataOperacao'];
  }
}
