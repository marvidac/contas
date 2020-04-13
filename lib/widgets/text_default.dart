import 'package:flutter/material.dart';

class TextDefault extends StatelessWidget {
  String _text;
  FontWeight _weight;
  double size;

  TextDefault(this._text, [this._weight = FontWeight.normal, this.size = 15]);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      this._text,
      style: TextStyle(
        fontWeight: this._weight == null ? FontWeight.normal : this._weight ,
        fontSize: this.size,
        color: Theme.of(context).textTheme.display2.color,
      ),
    );
  }
}
