# investtest

O projeto serve para controlar os investimentos (compras e vendas) feitos nos ativos em renda variável (Ações e FII's) na Brasil, Bolsa, Balcão (B3).

## Dependências

- Android Studio
- Flutter

## Como executar o projeto

1 - Faça o clone do projeto acessando a url [https://github.com/lopesluisjorge/flutter_formulario.git](https://github.com/lopesluisjorge/flutter_formulario.git)

2 - Execute os seguintes passos passos:

```sh
cd flutter_formulario
flutter run
```

## A estrutura do projeto

A estrutura do projeto na pasta `lib/` é a seguinte: 

```sh
.
├── main.dart
├── models
│   └── negocacao.dart
└── screens
    ├── investtest.dart
    └── negociacao_form.dart

2 directories, 4 files
```

Todas as telas estão na pasta `screens` e os modelos estão na pasta `models`. 

## A funcionamento

O projeto possui apenas uma tela (Formulário de cadastro de negociação de ativo). Nele temos o `Ticker` (código de negociação do ativo), `Corretora`, `Tipo de operação` (Compra ou Venda), `Quantidade`, `Preço` e `Data de negociação`.

`Ticker` e `Corretora` são valores pré definidos salvos em uma estrutura `List<String>`.

A negociação será salva caso o usuário pressione o botão `Cadastrar`. Nesse caso a negociação será impressa, adicionada a um repositório de negociações, do tipo `List<Negociação>` e o repositório será impresso.

## Telas

Tela de cadastro

[./screenshots/app.png](./screenshots/app.png)
