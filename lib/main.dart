import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jesors/details_personels.dart';
import 'package:jesors/justifications.dart';
import 'package:jesors/mes_declarations.dart';

import 'new_declaration.dart';

void main() {
  runApp(JeSors());
}

class JeSors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeSors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),

      //For App Localization
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //Supported Languages
      supportedLocales: [
        const Locale('fr', 'FR'),
      ],
      home: MyHomePage(title: 'JeSors'),
      routes: {
        NewDeclaration.routeName: (ctx) => NewDeclaration(),
        MesDeclaration.routeName: (ctx) => MesDeclaration(),
        Justifications.routeName: (ctx) => Justifications(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DetailsPersonels(),
          ],
        ),
      ),
    );
  }
}
