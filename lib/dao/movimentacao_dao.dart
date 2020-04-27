import 'package:contasv2/dao/generic_dao.dart';
import 'package:contasv2/models/movimentacao.dart';

class MovimentacaoDao extends GenericDao<Movimentacao> {
  @override
  String get tableName => "movimentacao";

  @override
  Movimentacao fromMap(Map<String, dynamic> map) {
    return Movimentacao.fromMap(map);
  }

}