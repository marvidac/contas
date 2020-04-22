import 'package:contasv1/models/tipo_movimentacao_enum.dart';
import 'package:contasv1/sql/entity.dart';
import 'dart:convert' as convert;

class Movimentacao extends Entity {

  int id;
  String data;
  String referencia;
  String descricao;
  double valor;
  String parcelado;
  int qtde_parcelas;
  String fixa;
  TipoMovimentacao tipo;
  String sou_pagador;
  String nome_pagador;
  String pago;
  String observacao;

  Movimentacao(
    {
      this.id,
      this.data, 
      this.referencia,
      this.descricao,
      this.valor,
      this.parcelado,
      this.qtde_parcelas,
      this.fixa,
      this.tipo,
      this.sou_pagador,
      this.nome_pagador,
      this.pago,
      this.observacao
    }
  );

  Movimentacao.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    id = map['data'];
    id = map['referencia'];
    id = map['descricao'];
    id = map['valor'];
    id = map['parcelado'];
    id = map['qtde_parcelas'];
    id = map['fixa'];
    id = map['tipo'];
    id = map['sou_pagador'];
    id = map['nome_pagador'];
    id = map['pago'];
    id = map['observacao'];
  }
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['referencia'] = this.referencia;
    data['descricao'] = this.descricao;
    data['valor'] = this.valor;
    data['parcelado'] = this.parcelado;
    data['qtde_parcelas'] = this.qtde_parcelas;
    data['fixa'] = this.fixa;
    data['tipo'] = this.tipo;
    data['sou_pagador'] = this.sou_pagador;
    data['nome_pagador'] = this.nome_pagador;
    data['pago'] = this.pago;
    data['observacao'] = this.observacao;

    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}