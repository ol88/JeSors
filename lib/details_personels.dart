import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'justifications.dart';

class DetailsPersonels extends StatefulWidget {
  @override
  _DetailsPersonelsState createState() => _DetailsPersonelsState();
}

class _DetailsPersonelsState extends State<DetailsPersonels> {
  final _focusScopeNode = FocusScopeNode();
  final _formKey = GlobalKey<FormState>();
  final _dateTextController = TextEditingController();
  final _dateFormat = DateFormat("d MMMM yyyy", 'fr');
  var _selectedDate = DateTime.now();
  final _lastNameFocus = FocusNode();
  final _addressFocus = FocusNode();
  var firstName = "";
  var lastName = "";
  var dateOfBirth = "";
  var address = "";

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: _focusScopeNode,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Votre prénom',
                  labelText: 'Prénom',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_lastNameFocus),
                onSaved: (value) => firstName = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Votre prénom doit être renseigné.';
                  }
                  return null;
                },
              ),
              TextFormField(
                focusNode: _lastNameFocus,
                onFieldSubmitted: (value) => _selectDateOfBirth(context),
                decoration: const InputDecoration(
                  hintText: 'Votre nom de famille',
                  labelText: 'Nom de famille',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (value) => lastName = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Votre nom de famille doit être renseigné.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Votre date de Naissance',
                  labelText: 'Date de naissance',
                ),
                controller: _dateTextController,
                onTap: () => _selectDateOfBirth(context),
                onSaved: (value) => dateOfBirth = value,
                validator: (value) {
                  if (value == _dateFormat.format(DateTime.now())) {
                    return "Votre date de naissance ne peut pas être aujourd'hui.";
                  }
                  return null;
                },
              ),
              TextFormField(
                focusNode: _addressFocus,
                onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                  hintText: "Votre addresse aujourd'hui (domicile, hôtel...)",
                  labelText: "Adresse",
                ),
                minLines: 3,
                maxLines: 10,
                textInputAction: TextInputAction.done,
                onSaved: (value) => address = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Votre addresse doit être renseignée.';
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text("Continuer et choisir la raison de ma sortie..."),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.of(context).pushNamed(Justifications.routeName,
                        arguments: [firstName, lastName, dateOfBirth, address]);
                  }
                },
              )
            ],
          ),
        ),
      ),
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
        FocusScope.of(context).requestFocus(_addressFocus);
      });
  }
}
