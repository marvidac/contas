import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class DateTimeFieldForm extends StatefulWidget {

  final String format;
  final TextEditingController _tController;
  final String label;

  DateTimeFieldForm(this.label, this.format, this._tController);

  @override
  _DateTimeFieldFormState createState() {
    return _DateTimeFieldFormState();
  }
}

class _DateTimeFieldFormState extends State<DateTimeFieldForm> {

  TextEditingController _tController;
  String format, label;

  void initState() {
    this._tController = widget._tController;
    this.format = widget.format;
    this.label = widget.label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: InputDecoration(
        labelText: this.label,
      ),
      format: DateFormat(this.format),
      controller: this._tController,
      onChanged: (DateTime newValue) {
        setState(() {
          this._tController.text = new DateFormat(this.format).format(newValue);
        });
      },
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
      },
    );
  }
}
