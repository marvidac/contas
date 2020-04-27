import 'package:flutter/material.dart';
import 'package:contasv2/widgets/resumo_percentual_main.dart';
import 'package:contasv2/pages/movimentacao_form.dart';
import 'package:contasv2/widgets/lista_movimentacoes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mais uma tentativa',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MovimentacaoForm();
                  }),
                );
              },
            ),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          elevation: 50.0,
          child: UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            accountName: Text("Marcus Dantas"),
            accountEmail: Text("marvidac@gmail.com"),
          ),
        ),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Center _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ResumoPercentualMain("Saldo Salário", 0.6),
          //Text('Nada', style: Theme.of(context).textTheme.display1,),
          ListaMovimentacoes(),

        ],
      ),
    );
  }
}
