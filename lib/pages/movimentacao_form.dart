import 'package:contasv1/dao/movimentacao_dao.dart';
import 'package:contasv1/models/movimentacao.dart';
import 'package:contasv1/models/tipo_movimentacao_enum.dart';
import 'package:contasv1/widgets/date_time_field_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MovimentacaoForm extends StatefulWidget {

  final Movimentacao movimentacao;

  MovimentacaoForm({this.movimentacao})  ;

  @override
  _MovimentacaoFormState createState() => _MovimentacaoFormState();
}

class _MovimentacaoFormState extends State<MovimentacaoForm> {

  Movimentacao get movimentacao => widget.movimentacao;

  final _formKey = GlobalKey<FormState>();
  final _tData = TextEditingController();
  final _tReferencia = TextEditingController();
  
  final _tDescricao = TextEditingController();
  final _tValor = MoneyMaskedTextController(
      leftSymbol: 'R\$ ', decimalSeparator: ',', thousandSeparator: '.');
  final _tParcelado = TextEditingController();
  final _tQtdeParcelas = TextEditingController();
  final _tFixa = TextEditingController();
  final _tSouPagador = TextEditingController();
  final _tTipo = TextEditingController();
  final _tPago = TextEditingController();
  final _tObservacao = TextEditingController();
  bool _souPagador = false;
  bool _fixa = false;
  bool _parcelado = false;
  bool _pago = false;

  String _tipo;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy");

    return Scaffold(
      appBar: AppBar(
        title: Text("Movimentação"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView(
                  children: <Widget>[
                    DateTimeFieldForm('Data', 'dd/MM/yyyy', this._tData),
                    DateTimeFieldForm('Referência', 'MM/yyyy', this._tReferencia),
                    TextField(
                      decoration: InputDecoration(labelText: "Descrição"),
                      controller: this._tDescricao,
                    ),
                    TextField(
                      controller: this._tValor,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Valor"),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Parcelado?",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: this._parcelado,
                          onChanged: (bool newValor) => {
                            setState(
                                  () {
                                this._parcelado = newValor;
                                 this._tParcelado.text = (this._parcelado) ? 'S' : 'N';
                              },
                            )
                          },
                        ),
                      ],
                    ),
                    TextField(
                      controller: this._tQtdeParcelas,
                      keyboardType: TextInputType.number,
                      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(labelText: "Qtde. Parcelas"),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Fixa?",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: _fixa,
                          onChanged: (bool newValor) => {
                            setState(
                                  () {
                                this._fixa = newValor;
                                this._tFixa.text = (this._fixa) ? 'S' : 'N';
                              },
                            )
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text(
                            "Tipo",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: this._tipo,
                          onChanged: (String newValue) {
                            setState(() {
                              this._tipo = newValue;
                              this._tTipo.text = this._tipo;
                            });
                          },
                          items: <String>['Pagamento', 'Recebimento']
                              .map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Sou pagador?",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: this._souPagador,
                          onChanged: (bool newValor) => {
                            setState(
                                  () {
                                this._souPagador = newValor;
                                this._tSouPagador.text = (this._souPagador) ? 'S' : 'N';
                              },
                            )
                          },
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Nome Pagador"),
                      controller: this._tSouPagador,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Pago?",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        Checkbox(
                          value: _pago,
                          onChanged: (bool newValor) => {
                            setState(
                                  () {
                                this._pago = newValor;
                                this._tPago.text = (this._pago) ? 'S' : 'N';
                              },
                            )
                          },
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Observação"),
                      controller: this._tObservacao,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      _salvarMovimentacao();
                    },
                  ),
                  Container(padding: EdgeInsets.all(10),),
                  RaisedButton(
                    textTheme: ButtonTextTheme.accent,
                    child: Text("Cancelar"),
                    onPressed: () {

                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvarMovimentacao() {
    MovimentacaoDao movDao;
    
    var mov = movimentacao ?? Movimentacao();
    mov.data = this._tData.text;
    mov.referencia = this._tReferencia.text;
    mov.descricao = this._tDescricao.text;
    mov.valor = this._tValor.numberValue;
    mov.parcelado = this._tParcelado.text;
    mov.qtde_parcelas = int.parse(this._tQtdeParcelas.text);
    mov.fixa = this._tFixa.text;
    mov.tipo = this._tTipo.text=='C' ? TipoMovimentacao.C : TipoMovimentacao.D;
    mov.sou_pagador = this._tSouPagador.text;
    mov.nome_pagador = this._tSouPagador.text;
    mov.pago = this._tPago.text;
    mov.observacao = this._tObservacao.text;

    movDao.save(mov);

  }
}
