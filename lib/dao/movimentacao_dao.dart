import 'package:contasv1/dao/generic_dao.dart';
import 'package:contasv1/models/movimentacao.dart';

class MovimentacaoDao extends GenericDao<Movimentacao> {
  @override
  String get tableName => "movimentacao";

  @override
  Movimentacao fromMap(Map<String, dynamic> map) {
    return Movimentacao.fromMap(map);
  }

}