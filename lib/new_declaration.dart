import 'package:flutter/material.dart';

class NewDeclaration extends StatelessWidget {
  static const routeName = '/newDeclaration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nouvelle Déclaration")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            RichText(text: null),
            RichText(text: null),
            RichText(text: null),
          ],
        ),
      ),
    );
  }
}
