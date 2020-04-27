import 'package:contasv2/models/movimentacao.dart';
import 'package:contasv2/pages/movimentacao_form.dart';
import 'package:flutter/material.dart';
import 'package:contasv2/dao/movimentacao_dao.dart';

class ListaMovimentacoes extends StatefulWidget {
  @override
  _ListaMovimentacoesState createState() => _ListaMovimentacoesState();
}

class _ListaMovimentacoesState extends State<ListaMovimentacoes> {
  MovimentacaoDao movDao = new MovimentacaoDao();
  List<Movimentacao> listaMovimentacoes;
  int qtdeRegistros = 0;

  @override
  void initState() {
    super.initState();

    movDao.findAll().then((movs) {
      setState(() {
        listaMovimentacoes = movs;
        qtdeRegistros = movs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height*0.5,
          child: ListView.builder(
            itemCount: qtdeRegistros,
            itemBuilder: (context, index) {
              Movimentacao mov = listaMovimentacoes[index];
              return ListTile(
                title: Text(mov.data),
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MovimentacaoForm(movimentacao: mov,);
                  }),
                );
              },
              );
            },
          ),
        ),
      ],
    );
  }
}
