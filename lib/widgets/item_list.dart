import 'package:contasv1/widgets/text_default.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  String title;
  String subtitle;
  double value;
  String complemento;

  ItemList(this.title, this.subtitle, this.value, [this.complemento]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.white),
        ),
        child: ListTile(
          leading: Icon(Icons.check_box_outline_blank, color: Colors.lightBlue[300],),
          title: TextDefault(this.title),
          subtitle: TextDefault(this.subtitle + (this.complemento!=null ? "          ($complemento)" : "")),
          trailing: TextDefault("R\$ $value"),
          onTap: () => _onClickItemList(this.title),
        ),
      ),
    );
  }

  void _onClickItemList(text) {
        print(text);
  }
}
