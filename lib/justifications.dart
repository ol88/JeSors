import 'package:flutter/material.dart';

import 'new_declaration.dart';
import 'raisons.dart';

class Justifications extends StatefulWidget {
  static const routeName = '/justifications';

  @override
  _JustificationsState createState() => _JustificationsState();
}

class _JustificationsState extends State<Justifications> {
  var _reason = 0;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<String> personalDetails =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Raison(s) de sortie"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                  "certifie que mon déplacement est lié au motif suivant (cocher la case) autorisé par l’article 1er du décret du 16 mars 2020 portant réglementation des déplacements dans le cadre de la lutte contre la propagation du virus Covid-19 :"),
              RadioListTile(
                title: Text(Raisons.raisons[0]),
                value: 0,
                //selected: true,
                groupValue: _reason,
                onChanged: (value) => _selectReason(value),
              ),
              RadioListTile(
                title: Text(Raisons.raisons[1]),
                value: 1,
                groupValue: _reason,
                onChanged: (value) => _selectReason(value),
              ),
              RadioListTile(
                title: Text(Raisons.raisons[2]),
                value: 2,
                groupValue: _reason,
                onChanged: (value) => _selectReason(value),
              ),
              RadioListTile(
                title: Text(Raisons.raisons[3]),
                value: 3,
                groupValue: _reason,
                onChanged: (value) => _selectReason(value),
              ),
              RadioListTile(
                title: Text(Raisons.raisons[4]),
                value: 4,
                groupValue: _reason,
                onChanged: (value) => _selectReason(value),
              ),
              RaisedButton(
                child: Text("Signer ma déclaration."),
                onPressed: () {
                  Navigator.of(context).pushNamed(NewDeclaration.routeName,
                      arguments: {
                        "reason": _reason,
                        "details": personalDetails
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _selectReason(int reason) {
    setState(() {
      _reason = reason;
    });
  }
}
