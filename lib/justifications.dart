import 'package:flutter/material.dart';

import 'new_declaration.dart';
import 'raisons.dart';

enum Reasons {
  Reason1,
  Reason2,
  Reason3,
  Reason4,
  Reason5,
}

class Justifications extends StatefulWidget {
  static const routeName = '/justifications';
  @override
  _JustificationsState createState() => _JustificationsState();
}

class _JustificationsState extends State<Justifications> {
  Reasons _reason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raison(s) de sortie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            
            RadioListTile(
              title: Text(Raisons.raison1),
              value: Reasons.Reason1,
              groupValue: _reason,
              onChanged: (value) => _selectReason(value),
            ),
            RadioListTile(
              title: Text(Raisons.raison2),
              value: Reasons.Reason2,
              groupValue: _reason,
              onChanged: (value) => _selectReason(value),
            ),
            RadioListTile(
              title: Text(Raisons.raison3),
              value: Reasons.Reason3,
              groupValue: _reason,
              onChanged: (value) => _selectReason(value),
            ),
            RadioListTile(
              title: Text(Raisons.raison4),
              value: Reasons.Reason4,
              groupValue: _reason,
              onChanged: (value) => _selectReason(value),
            ),
            RadioListTile(
              title: Text(Raisons.raison5),
              value: Reasons.Reason5,
              groupValue: _reason,
              onChanged: (value) => _selectReason(value),
            ),
            RaisedButton(
              child: Text("Enregistrer ma déclaration."),
              onPressed: () {
                Navigator.of(context).pushNamed(NewDeclaration.routeName);
              },
            )
          ],
        ),
      ),
    );
  }

  void _selectReason(Reasons reason) {
    setState(() {
      _reason = reason;
    });
  }
}
