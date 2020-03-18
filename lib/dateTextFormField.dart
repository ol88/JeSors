import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFormField extends StatefulWidget {
  final FocusNode focus;
  final FocusNode nextFocus;
  
  @override
  DateTextFormField(this.focus, this.nextFocus);

  @override
  _DateTextFormFieldState createState() => _DateTextFormFieldState();
}

class _DateTextFormFieldState extends State<DateTextFormField> {
  final _dateFormat = DateFormat("d MMMM yyyy");
  var _selectedDate = DateTime.now();
  final _dateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focus,
      onChanged: (value) =>
          FocusScope.of(context).requestFocus(widget.nextFocus),
      decoration: const InputDecoration(
        hintText: 'Votre date de Naissance',
        labelText: 'Date de naissance',
      ),
      controller: _dateTextController,
      onTap: () => _selectDateOfBirth(context),
      validator: (value) {
        // TODO make a validator so it's at least more than 1 day form the day the form is field and not in the future.
        if (value == _dateFormat.format(DateTime.now())) {
          return "Votre date de naissance ne peut pas être aujourd'hui.";
        }
        return null;
      },
    );
  }

  Future<Null> _selectDateOfBirth(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1850),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _dateTextController.text = _dateFormat.format(_selectedDate);
      });
  }
}
