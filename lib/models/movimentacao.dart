import 'package:contasv1/models/tipo_movimentacao_enum.dart';

class Movimentacao {

  Movimentacao();

  int _id;
  DateTime _data;
  DateTime _referencia;
  String _descricao;
  double _valor;
  String _parcelado;
  int _qtde_parcelas;
  bool _fixa;
  TipoMovimentacao _tipo;
  bool _sou_pagador;
  String _nome_pagador;
  bool _pago;
  String _obs;
}