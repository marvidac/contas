import 'package:contasv1/pages/movimentacao_form.dart';
import 'package:contasv1/widgets/item_list.dart';
import 'package:contasv1/widgets/text_default.dart';
import 'package:contasv1/widgets/text_form_field_default.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orçamento Pessoal"),
        elevation: 10,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () => {print("Ir para cadastro de movimentação")},
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
              accountEmail: Text("marvidac@gmail.com"),
              accountName: Text("Marcus Dantas"),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: TextDefault("Movimentação"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return MovimentacaoForm();
                  })
                )
              },
            ),
          ],
        )),
      ),
      body: Column(
        children: <Widget>[
          TextFormFieldDefault.label("Digite o que buscar"),
          Container(
            padding: EdgeInsets.only(bottom: 1),
            //Definindo altura da ListView
            height: MediaQuery.of(context).size.height * 0.657,
            child: ListView(
              children: <Widget>[
                ItemList(
                    "Descrição do Pagamento 1", "01/03/2020", 35.18, "CRÉDITO"),
                ItemList(
                    "Descrição do Pagamento 2", "03/03/2020", -35.11, "DÉBITO"),
                ItemList(
                    "Descrição do Pagamento 3", "15/03/2020", 45.01, "CRÉDITO"),
                ItemList("Descrição do Pagamento 4", "18/03/2020", 528.55,
                    "CRÉDITO"),
                ItemList(
                    "Descrição do Pagamento 5", "22/03/2020", 411.88, "DÉBITO"),
                ItemList(
                    "Descrição do Pagamento 6", "23/03/2020", 41.96, "CRÉDITO"),
                ItemList(
                    "Descrição do Pagamento 7", "24/03/2020", 63.98, "DÉBITO"),
                ItemList(
                    "Descrição do Pagamento 8", "20/03/2020", 42.85, "CRÉDITO"),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
            //Definindo altura da ListView
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(left: 10, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "CRÉDITO",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "RECEBIDO",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 45654.00",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "À RECEBER",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 45654.00",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.only(left: 10, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "DÉBITO",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "PAGO",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 45654.00",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "À PAGAR",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$ 45654.00",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
