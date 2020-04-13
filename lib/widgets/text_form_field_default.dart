import 'package:flutter/material.dart';

class TextFormFieldDefault extends StatelessWidget {
  String label;

  TextFormFieldDefault(this.label) {
    this.label = label;
  }

  TextFormFieldDefault.label(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: this.label,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
